require_relative '../lib/users'
require 'database_helper'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'johndoe@example.com',
        password: 'Password123'
      )

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'johndoe@example.com'
    end
  end
end