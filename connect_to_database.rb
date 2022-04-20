require './lib/database_connection'

if ENV['RACK_ENV'] = 'test'
  DatabaseConnection.setup(dbname: 'makersbnb')
else
  DatabaseConnection.setup(dbname: 'makersbnb')
end
