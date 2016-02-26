class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, inverse_of: :sub_category
  has_many :filters
  has_many :filter_options, through: :filters
  has_one :picture, as: :imageable

  accepts_nested_attributes_for :filters, allow_destroy: true
end
