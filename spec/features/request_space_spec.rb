feature 'Request' do
  scenario 'user can make a request' do
    user = User.create(
      email: 'johndoe@example.com',
      password: 'Password123'
    )
    user2 = User.create(
      email: 'janedoe@example.com',
      password: 'Password123'
    )
    space = Space.create(name: 'John Does space', price: '150', description: 'Beautiful', user_id: user.id)
    availability = Availability.create(space_id: space.id, date: "2022-04-21")
    visit('/')
    click_button('Sign in')
    fill_in :email, with: "janedoe@example.com"
    fill_in :password, with: "Password123"
    click_button('View')
    select "2022-04-21", :from => "availability"
    click_button('Request')
    find('body').has_content?("Please email the host at johndoe@example.com.")
  end
end
