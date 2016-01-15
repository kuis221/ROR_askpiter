class Video < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
  belongs_to :user
  
  has_many :favourite_videos
  has_many :users, through: :favourite_videos
  has_one :picture, as: :imageable
end
