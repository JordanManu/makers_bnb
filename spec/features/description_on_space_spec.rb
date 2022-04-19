feature 'Space has description' do
  scenario 'Each space will show a small description of what the place is like' do
    visit('/spaces')
    fill_in :start_date, with: "19/04/2022"
    fill_in :end_date, with: "22/04/2022"
    fill_in :location, with: "London"
    click_button('Submit')
    expect(page).to have_content('Description: Strawberry Fields Cottage is a')
  end
end