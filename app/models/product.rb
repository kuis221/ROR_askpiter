class Product < ActiveRecord::Base
  belongs_to :sub_category
  has_many :videos
end
