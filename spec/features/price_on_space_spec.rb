feature 'Space has price' do
  scenario 'Each space will show the price of 1 night' do
    visit('/spaces')
    fill_in :name, with: "Strawberry Fields Cottage"
    fill_in :price, with: "150.00"
    fill_in :description, with: "Strawberry Fields Cottage is a"
    click_button('New Listing')
    expect(page).to have_content('Price: £150.00')
  end
end