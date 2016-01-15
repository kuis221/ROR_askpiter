class Company < ActiveRecord::Base
  has_many :products
  has_many :pos, class_name: 'POS'
  has_many :distributors, through: :pos
end
