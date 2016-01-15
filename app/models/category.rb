class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
  has_many :videos
  has_many :photos
end
