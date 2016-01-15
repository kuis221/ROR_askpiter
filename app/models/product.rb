class Product < ActiveRecord::Base
  belongs_to :sub_category
  has_many :videos
  has_many :photos
  has_many :prices
  has_many :attrs, class_name: "Attribute"
  has_many :ratings
  has_many :reviews
  has_many :dimensions
  has_many :favourite_products
  has_many :users, through: :favourite_products
  has_many :pictures, as: :imageable
end
