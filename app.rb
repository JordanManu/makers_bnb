require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    # take the params and .create the user.
    # create session for the use with its id
    redirect '/spaces'
  end

  get '/spaces' do
    # call up the session, and its id
    # Calls up the right user
    erb(:spaces) #Welcome... take the user information fro the user in the session.
  end

  run! if app_file == $0
end