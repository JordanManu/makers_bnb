class Availability

  attr_reader :space, :date, :id

  def initialize(id:, space:, date:)
    @id = id
    @space = space
    @date = date
  end

  def self.create(space:, date:)
    result = DatabaseConnection.query(
    "INSERT INTO availability (space, date) VALUES($1, $2) RETURNING id, space, date;", 
    [space, date]
    )
    Availability.new(
    id: result[0]['id'], 
    space: result[0]['space'],
    date: result[0]['date']
    )
  end
end