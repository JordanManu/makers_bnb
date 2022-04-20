feature 'available dates' do
  scenario 'it lists the dates the space is available' do
    space = Space.create(name: 'Strawberry Fields Cottage', price: '150', description: 'Beautiful')
    visit '/spaces/availability/new'
    select "Strawberry Fields Cottage", :from => "space"
    fill_in "date", :with => "25/4/2022"
    click_button 'Submit'

    expect(page).to have_content "Availability for Strawberry Fields Cottage has been added for 25/4/2022"
  end
end