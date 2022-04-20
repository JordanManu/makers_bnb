require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/users'
require_relative './lib/database_connection'
# require_relative './connect_to_database'
require './database_connection_setup'

class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    p @user
    session[:user_id] = @user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @user = User.find(session[:user_id])
    erb(:spaces) #Welcome... take the user information fro the user in the session.
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