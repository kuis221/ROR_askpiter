class Video < ActiveRecord::Base
  include Recentable

  belongs_to :category
  belongs_to :product
  belongs_to :user

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites
  has_one :picture, as: :imageable

  accepts_nested_attributes_for :picture, allow_destroy: true

end
