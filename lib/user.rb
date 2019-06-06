require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    password_digest = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password_digest) VALUES('#{email}', '#{password_digest}') RETURNING id, email, password_digest;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end
