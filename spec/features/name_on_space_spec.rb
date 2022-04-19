feature 'Space has name' do
  scenario 'Each space will show the name of the space' do
    visit('/spaces')
    fill_in :start_date, with: "19/04/2022"
    fill_in :end_date, with: "22/04/2022"
    fill_in :location, with: "London"
    click_button('Submit')
    expect(page).to have_content('Strawberry Fields Cottage')
  end
end