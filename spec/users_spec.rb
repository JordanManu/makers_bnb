describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'johndoe@example.com',
        password: 'Password123'
      )

      expect(user).to be_a User
      expect(user.email).to eq 'johndoe@example.com'
    end
  end
end