class Distributor < ActiveRecord::Base
  has_many :pos, class_name: 'POS'
  has_many :companies, through: :pos
end
