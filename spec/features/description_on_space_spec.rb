feature 'Space has description' do
  scenario 'Each space will show a small description of what the place is like' do
    visit('/spaces')
    fill_in :name, with: "Strawberry Fields Cottage"
    fill_in :price, with: "150.00"
    fill_in :description, with: "Strawberry Fields Cottage is a"
    click_button('New Listing')
    expect(page).to have_content('Description: Strawberry Fields Cottage is a')
  end
end