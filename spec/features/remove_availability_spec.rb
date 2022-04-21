feature 'Remove Availability' do
  scenario 'User can remove Availability' do
    user = User.create(
      email: 'johndoe@example.com',
      password: 'Password123'
    )
    space = Space.create(name: 'Strawberry', price: '150.00', description: 'Fields Cottage', user_id: user.id)
    Availability.create(space_id: space.id, date: "2022-04-21")
    visit("/sessions/new")
    fill_in :email, with: "johndoe@example.com"
    fill_in :password, with: "Password123"
    click_button('Sign in')
    visit("/spaces/#{space.id}")
    select "2022-04-21", :from => "availability"
    click_button("Remove")
    expect(page).to have_content("You have deleted")
  end
end