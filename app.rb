require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/users'
require_relative './lib/space'
require_relative './lib/database_connection'
require './database_connection_setup'


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
    @spaces = Space.all
   erb(:'spaces/index')
  end

  post '/spaces/new' do
    name = params[:name]
    price = params[:price]
    description = params[:description]
    Space.create(name: name, price: price, description: description)
    redirect '/spaces'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/spaces'
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

  run! if app_file == $0
end
