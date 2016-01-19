class Company < ActiveRecord::Base
  has_many :products
  has_many :pos, class_name: 'POS'
  has_many :distributors, through: :pos

  has_one :address, as: :addressable

  has_many :favourite_companies
  has_many :users, through: :favourite_companies

  accepts_nested_attributes_for :address

  scope :international, -> { where( international: true ) }
  scope :local, -> { where( international: false ) }
end
