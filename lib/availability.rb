class Availability

  attr_reader :space_id, :date, :id

  def initialize(id:, space_id:, date:)
    @id = id
    @space_id = space_id
    @date = date
  end

  def self.create(space_id:, date:)
    result = DatabaseConnection.query(
    "INSERT INTO availability (space_id, date) VALUES($1, $2) RETURNING id, space_id, date;", 
    [space_id, date]
    )
    Availability.new(
    id: result[0]['id'], 
    space_id: result[0]['space_id'],
    date: result[0]['date']
    )
  end
end