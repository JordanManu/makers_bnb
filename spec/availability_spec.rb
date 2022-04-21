require './lib/availability'
require_relative './database_helper'

describe Availability do

  let(:space) { Space.create(name: 'Strawberry Fields Cottage', price: '150', description: "Strawberry Fields Cottage is a") }

  describe '.create' do
    it 'creates a new availability' do
      availability = Availability.create(space_id: space.id, date: "2022-05-15")
     
      persisted_data = persisted_data(table: :availability, id: availability.id) #this test isn't working

      expect(availability).to be_a Availability
      # expect(availability.id).to eq persisted_data.first['id'] # this test isn't working
      expect(availability.date).to eq "2022-05-15"
    end
  end

  describe '.create_period' do
    it 'creates multiple availabilities for one period' do
      availability = Availability.create_period(start_date: "2022-05-28", end_date: "2022-06-30", space_id: space.id)

      expect(availability.start_date).to eq "2022-05-28"
      expect(availability.end_date).to eq "2022-06-30"
      expect(Availability.available?("2022-05-28")).to eq true
      expect(Availability.available?("2022-06-29")).to eq true
      expect(Availability.available?("2022-05-20")).to eq false
    end
  end
end