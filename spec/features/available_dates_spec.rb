feature 'available dates' do
  scenario 'it lists the dates the space is available' do
    space = Space.create(name: 'Strawberry Fields Cottage', price: '150', description: 'Beautiful')
    visit '/spaces/availability'
    select "Strawberry Fields Cottage", :from => "space"
    fill_in "date", :with => "2022/05/28"
    click_button 'Submit'

    expect(page).to have_content "Availability for Strawberry Fields Cottage has been added for 2022/05/28"
  end
end