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

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe 'list_space' do
    it 'user can list a space they own' do
      user = User.create(email: 'test@example.com', password: 'password123')
      space = double(user_id: user.id)
      user.list_space(space)
      expect(space.user_id).to eq user.id
    end
  end
end