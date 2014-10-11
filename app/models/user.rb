class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password_hash, presence: true

  has_many :rounds

  def password
    self.password_hash
  end

  def password=(new_password)
    if new_password.strip.length > 0
      self.password_hash = BCrypt::Password.create(new_password)
    end
  end

  def authenticate(password_input)
    BCrypt::Password.new(self.password) == password_input
  end
end

