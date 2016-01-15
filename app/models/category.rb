class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
  has_many :videos
  has_many :photos

  has_many :favourite_categories
  has_many :users, through: :favourite_categories
end
