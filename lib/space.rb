require_relative './database_connection'

class Space 
  attr_reader :id, :name, :price, :description, :user_id

  def initialize(id:, name:, price:, description:, user_id:)
    @id = id
    @name = name
    @price = price
    @description = description
    @user_id = user_id
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
        description: space['description'],
        user_id: space['user_id']
     )
    end
  end

  def self.create(name:, price:, description:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, price, description, user_id) VALUES($1, $2, $3, $4) RETURNING id, name, price, description, user_id;", 
      [name, price, description, user_id]
      )
    Space.new(
      id: result[0]['id'], 
      name: result[0]['name'], 
      price: result[0]['price'], 
      description: result[0]['description'],
      user_id: result[0]['user_id']
    )
  end

  def self.spaces_listed(id)
    result = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE user_id = #{id};"
    )
    result.map do |space| 
      Space.new(
        id: space['id'], 
        name: space['name'], 
        price: space['price'], 
        description: space['description'],
        user_id: space['user_id']
     )
    end
  end

end