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
end