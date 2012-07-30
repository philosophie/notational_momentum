class User < ActiveRecord::Base
  attr_accessor :password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: {
    if: :password
  }

  def password=(password)
    unless password.empty?
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end
  end
end
