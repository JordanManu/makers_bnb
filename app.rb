require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'

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
   erb(:'spaces/index')
  end

  post '/spaces' do
    start_date = params[:start_date]
    end_date = params[:end_date]
    location = params[:location]
    redirect '/spaces/search_result'
  end

  get '/spaces/search_result' do
    "Description: Strawberry Fields Cottage is a \n
    Price: £"
    
  end

  run! if app_file == $0
end
