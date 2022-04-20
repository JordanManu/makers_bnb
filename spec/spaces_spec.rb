require 'space'

describe Space do 
  let(:space) { Space.create( name: 'Strawberry Fields Cottage', price: "100.00", description: "Strawberry Fields Cottage is a") }
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
        expect(space.price).to eq '100.00'
      end
    end

    context "#.all" do
      it "shows all the spaces" do
        space = Space.create(name: 'Strawberry', price: '150.00', description: 'Fields Cottage')
        space2 = Space.create(name: 'Strawberry2', price: '150.00', description: 'Fields Cottage2')
        expect(Space.all.length).to eq 2
      end
    end

    context "#.create" do
      it "Creates a new listing" do
        space = Space.create(name: 'Blueberry Fields', price: '200.00', description: 'Fields Cottage')

        expect(space.name).to eq 'Blueberry Fields'
        expect(space.price).to eq '200.00'
        expect(space.description).to eq 'Fields Cottage'
      end
    end
end