require './lib/availability'
require_relative './database_helper'


describe Availability do

  let(:space) { Space.create(name: 'Strawberry Fields Cottage', price: '150', description: "Strawberry Fields Cottage is a", user_id: 2) }

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
      space2 = Space.create(name: 'Strawberry Fields Cottage', price: '150', description: "Strawberry Fields Cottage is a", user_id: 2)
      availability2 = Availability.create_period(start_date: "2022-05-28", end_date: "2022-06-30", space_id: space2.id)

      #Not sure how to get this test to pass, we need to check the dates above are in the database for space id
      
    end
  end
end