feature 'Space has price' do
  scenario 'Each space will show the price of 1 night' do
    visit('/spaces')
    fill_in :start_date, with: "19/04/2022"
    fill_in :end_date, with: "22/04/2022"
    fill_in :location, with: "London"
    click_button('Submit')
    expect(page).to have_content('Price: £')
  end
end