class User < ActiveRecord::Base
  include BCrypt
  has_many :ratings
  has_many :books, through: :ratings

  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(typed_password)
    return true if Password.new(self.password_hash) == typed_password
    false
  end

end