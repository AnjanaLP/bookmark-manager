require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: "anjana@example.com", password: "password123")

      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq "anjana@example.com"
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns the user with the given id' do
      user = User.create(email: "anjana@example.com", password: "password123")
      returned_user = User.find(id: user.id)

      expect(returned_user).to be_a User
      expect(returned_user.id).to eq user.id
      expect(returned_user.email).to eq user.email
    end

    it 'returns nil if no id is given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
