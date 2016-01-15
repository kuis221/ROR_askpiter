class Product < ActiveRecord::Base
  belongs_to :sub_category
  has_many :videos
  has_many :photos
  has_many :prices
  has_many :attributes
end
