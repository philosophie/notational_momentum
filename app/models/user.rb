class User < ActiveRecord::Base
  attr_accessor :password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true

  def password=(password)
    unless password.empty?
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end
  end
end
