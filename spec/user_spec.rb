require 'user'
require 'bcrypt'

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

  describe '.authenticate' do
    context 'the user exists and email and password are correct' do
      it 'returns the user' do
        user = User.create(email: "anjana@example.com", password: "password123")
        authenticated_user = User.authenticate(email: "anjana@example.com", password: "password123")

        expect(authenticated_user.id).to eq user.id
      end
    end

    context 'the email address is incorrect' do
      it 'returns nil' do
        user = User.create(email: "anjana@example.com", password: "password123")
        expect(User.authenticate(email: "wrong_email@example.com", password: "password123")).to be_nil
      end
    end

    context 'the password is incorrect' do
      it 'returns nil' do
        user = User.create(email: "anjana@example.com", password: "password123")
        expect(User.authenticate(email: "anjana@example.com", password: "wrong_password")).to be_nil
      end
    end
  end
end
