feature 'Adding available dates' do
  # scenario 'The host can add a single available date' do
  #   space = Space.create(name: 'Strawberry Fields Cottage', price: '150', description: 'Beautiful')
  #   visit '/spaces/availability'
  #   select "Strawberry Fields Cottage", :from => "space"
  #   fill_in "date", :with => "2022/05/28"
  #   click_button 'Submit'

  #   expect(page).to have_content "Availability for Strawberry Fields Cottage has been added for 2022/05/28"
  # end

  scenario 'The host can provde a period with start and end dates to create availability' do
    space = Space.create(name: 'Strawberry Fields Cottage', price: '150', description: 'Beautiful')
    visit '/spaces/availability'
    select "Strawberry Fields Cottage", :from => "space"
    fill_in "start_date", :with => "2022/05/28"
    fill_in "end_date", :with => "2022/06/30"
    click_button 'Submit'

    expect(page).to have_content "Availability for Strawberry Fields Cottage has been added 2022/05/28 to 2022/06/30"

  end
end