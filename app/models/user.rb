class User < ApplicationRecord
  has_secure_password
  has_many :hotels
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }

  has_many :favourites

  def self.fav_hotels(user)
    favs = []
    user.favourites.each { |a| favs << a.hotel_id }
    Hotel.where(id: favs)
  end
end
