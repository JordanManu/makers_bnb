require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/users'
require_relative './lib/space'
require_relative './lib/database_connection'
require './database_connection_setup'
require_relative './lib/availability'


class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/spaces' do
    @user = User.find(session[:user_id])
    if @user 
    @spaces = Space.spaces_listed(session[:user_id])
    end
    @all_spaces = Space.all
   erb(:'spaces/index')
  end

  post '/spaces/new' do
    name = params[:name]
    price = params[:price]
    description = params[:description]
    user_id = session[:user_id]
    Space.create(name: name, price: price, description: description, user_id: user_id)
    redirect '/spaces'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    if @user
    session[:user_id] = @user.id
    redirect '/spaces'
    else
      flash[:notice] = "Email already in use"
      redirect '/users/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  get '/spaces/availability' do
    @spaces = Space.all
    erb :"spaces/availability/new"
  end

  post '/spaces/availability/new' do
    space = Space.find_by_name(name: params[:space]) # return the id of the space with that name
    Availability.create_period(start_date: params[:start_date], end_date: params[:end_date], space_id: space.id)
    flash[:notice] = "Availability for #{params[:space]} has been added for #{params[:start_date]} to #{params[:end_date]}"
    redirect '/spaces/availability'
  end

  get '/spaces/:id' do
    @space = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE id = $1;", [params[:id]]
    )
    @user = User.find(session[:user_id])
    availability = DatabaseConnection.query(
      "SELECT * FROM availability WHERE space_id = $1;", [params[:id]]
    )
    @availability = availability.sort_by { |hash| hash['date'] }
    erb(:"spaces/show")
  end

  post '/spaces/availability/:id' do # availability (date) id (space_id)
    availability = Availability.find(params['availability'], params['id'])
    Availability.remove(id: availability[0]['id'])
    flash[:notice] = "You have deleted the availability on '#{params[:availability]}'"
    redirect "/spaces/#{params[:id]}"
  end

  post 'spaces/availability/request/:id' do
    p params
    space = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE id = $1;", [params[:id]]
    )
    host_id = space[0]['user_id']
    host = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1;", [host_id]
    )
    @host = host[0]
    flash[:notice] = "Please email the host at #{@host.email}."
    redirect "/spaces/:id"
  end

  run! if app_file == $0
end
