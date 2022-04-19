require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World!'
  end

  get '/home' do
    p 'is this working'
    erb :'home'
  end

  run! if app_file == $0
end