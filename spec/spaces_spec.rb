require 'space'

describe Space do 
  let(:space) { Space.create( name: 'Strawberry Fields Cottage', price: "100.00", description: "Strawberry Fields Cottage is a", user_id: 1) }
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
        space = Space.create(name: 'Strawberry', price: '150.00', description: 'Fields Cottage', user_id: 1)
        space2 = Space.create(name: 'Strawberry2', price: '150.00', description: 'Fields Cottage2', user_id: 1)
        expect(Space.all.length).to eq 2
      end
    end

    context "#.create" do
      it "Creates a new listing" do
        space = Space.create(name: 'Blueberry Fields', price: '200.00', description: 'Fields Cottage', user_id: 1)

        expect(space.name).to eq 'Blueberry Fields'
        expect(space.price).to eq '200.00'
        expect(space.description).to eq 'Fields Cottage'
      end
    end

    context "#.find_by_name" do
      it "finds the space id from the space name" do
        space = Space.create(name: 'Blueberry Fields', price: '200.00', description: 'Fields Cottage')
        result = Space.find_by_name(name: 'Blueberry Fields')

        expect(result.name).to eq space.name
        expect(result.id).to eq space.id
      end
    end
    
    context "#.spaces_listed" do
      it "Knows which user the space belongs to" do
        space = Space.create(name: 'Blueberry Fields', price: '200.00', description: 'Fields Cottage', user_id: 1)
        expect(space.user_id).to eq "1"
      end
      it "Multiple spaces can belong to the same user" do
        space = Space.create(name: 'Blueberry Fields', price: '200.00', description: 'Fields Cottage', user_id: 1)
        space2 = Space.create(name: 'Blueberry Farm', price: '210.00', description: 'Fields Cottages', user_id: 1)
        expect(Space.spaces_listed(1).length).to eq 2
      end
    end
end