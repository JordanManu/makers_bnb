require_relative './database_connection'

class Space 
  attr_reader :id, :name, :price, :description

  def initialize(id:, name:, price:, description:)
    @id = id
    @name = name
    @price = price
    @description = description
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * FROM spaces;"
      )
    result.map do |space| 
      Space.new(
        id: space['id'], 
        name: space['name'], 
        price: space['price'], 
        description: space['description']
     )
    end
  end

  def self.create(name:, price:, description:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, price, description) VALUES($1, $2, $3) RETURNING id, name, price, description;", 
      [name, price, description]
      )
    Space.new(
      id: result[0]['id'], 
      name: result[0]['name'], 
      price: result[0]['price'], 
      description: result[0]['description']
    )
  end

end