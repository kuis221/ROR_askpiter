class Photo < ActiveRecord::Base
  include Recentable

  belongs_to :product
  belongs_to :user
  belongs_to :category

  has_many :favourite_photos
  has_many :users, through: :favourite_photos
  has_one :picture, as: :imageable

  delegate :url, :title, to: :picture, allow_nil: true # .url and .title methods
end
