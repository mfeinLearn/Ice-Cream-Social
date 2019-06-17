class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_ice_creams, through: :reviews, source: :ice_cream
  # :ice_cream should be spelled exactly the same as it is in Review.rb (the review table)

  has_many :ice_creams #that they have created

  validates :username, uniqueness: true, presence: true

  has_secure_password


  # class method because it is going to be called on our user class
  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      # SecureRandom.hex - creates a random password for you
      u.password = SecureRandom.hex
    end
  end

end
