feature 'Space has price' do
  scenario 'Each space will show the price of 1 night' do
    visit('/users/new')
    fill_in :email, with: "test@example.com"
    fill_in :password, with: "password123"
    click_button('Sign Up')
    fill_in :name, with: "Strawberry Fields Cottage"
    fill_in :price, with: "150.00"
    fill_in :description, with: "Strawberry Fields Cottage is a"
    click_button('New Listing')
    find('body').has_content?('Price: £150.00')
  end
end