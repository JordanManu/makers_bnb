feature 'Sign Out' do
  scenario 'User can sign out of their account' do
    visit('/users/new')
    fill_in("email", with: "johndoe@example.com")
    fill_in('password', with: 'Password123')
    click_on('Sign Up')
    click_on('Sign Out')
    expect(page).to have_content('You have signed out.')
  end
end