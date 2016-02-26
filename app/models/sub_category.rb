class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, inverse_of: :sub_category
  has_many :filters
end
