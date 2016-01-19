class Photo < ActiveRecord::Base
  include Recentable

  belongs_to :product
  belongs_to :user
  belongs_to :category

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites
  has_one :picture, as: :imageable

  delegate :url, :title, to: :picture, allow_nil: true # .url and .title methods
end
