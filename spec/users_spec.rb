describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'johndoe@example.com',
        password: 'Password123'
      )
    end
  end
end