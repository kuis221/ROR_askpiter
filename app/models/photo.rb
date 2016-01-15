class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :category

  has_many :favourite_photos
  has_many :users, through: :favourite_photos
end
