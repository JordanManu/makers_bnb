# As a user
# So that i can use the app as a host or a guest
# I want to sign up for MakersBnB

feature 'New users can sign up' do
  scenario 'A user can sign up' do
    visit '/'
    click_on('Sign Up')
    expect(current_path).to eq '/users/new'
    fill_in("email", with: "johndoe@example.com")
    fill_in('password', with: 'Password123')
    click_on('Sign Up')
 
    expect(current_path).to eq '/spaces'
    find('body').has_content? "Welcome johndoe@example.com!"
  end

  scenario 'User cannot sign up if email already in use' do
    user = User.create(
        email: 'johndoe@example.com',
        password: 'Password123'
      )
    visit '/users/new'
    fill_in("email", with: "johndoe@example.com")
    fill_in('password', with: 'password123')
    click_on('Sign Up')

    expect(current_path).to eq '/users/new'
    find('body').has_content? "Email already in use"
  end
end
