class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
end
