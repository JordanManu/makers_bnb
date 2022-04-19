require 'spaces'

describe Space do 
  let(:space) { Space.new(name: 'Strawberry Fields Cottage', price: "£", description: "Strawberry Fields Cottage is a") }
  context "#name" do
    it "knows its name" do 
      expect(space.name).to eq "Strawberry Fields Cottage"
    end
  end

  context "#description" do
    it "Has a small description" do
      expect(space.description).to eq "Strawberry Fields Cottage is a"
    end
  end

  context "#price" do
    it "Has a price" do
    expect(space.price).to eq "£"
    end
  end
end