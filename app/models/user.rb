require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :directions
  validates :login, { presence: true,
											uniqueness: { case_sensitive: true, message: "Same Username exists" },
											length: { minimum: 3, message: "Username should be longer than 3 characters" },
											format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "Must be in Email form"}
										}
	def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
