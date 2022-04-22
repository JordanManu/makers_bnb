require 'byebug'

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

  def self.create_period(space_id:, start_date:, end_date:)
    start_date_parsed = Date.parse(start_date)
    end_date_parsed = Date.parse(end_date) 
    date = start_date_parsed
    until date == end_date_parsed + 1
      unless self.available?(date: date, space_id: space_id)
        self.create(space_id: space_id, date: date)
      end
      date += 1
    end
  end

  def self.remove(id:)
    DatabaseConnection.query(
      "DELETE FROM availability WHERE id = $1", [id]
    )
  end

  def self.available?(date:, space_id:)
    result = DatabaseConnection.query(
      "SELECT * FROM availability WHERE date = $1 AND space_id = $2", [date, space_id]
    )
    if result.first.nil?
      false
    else
      true
    end
  end

  def self.find(date, space_id)
    result = DatabaseConnection.query(
      "SELECT * FROM availability WHERE date = $1 AND space_id = $2", [date, space_id]
    )
  end

end