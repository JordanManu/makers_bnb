require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './connect_to_database'
require_relative './lib/space'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/spaces' do
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

  run! if app_file == $0
end
