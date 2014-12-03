class User < ActiveRecord::Base
  has_many :workouts
  has_many :feedbacks, through: :workouts
  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
