class Hotel < ApplicationRecord
  belongs_to :user
  has_many :favourites
  
  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
