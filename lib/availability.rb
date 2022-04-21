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
    # convert :start_Date and end_date into date class objects
    start_date_parsed = Date.parse(start_date)
    end_date_parsed = Date.parse(end_date) 
    # create and array of all of the dates in the period
    date = start_date_parsed
    until date == end_date_parsed + 1
      self.create(space_id: space_id, date: date)
      date += 1
    end
    # iterate over every date between :start_date and end_date, do
    # self.create on each of those dates.
  end
end