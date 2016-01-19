class Company < ActiveRecord::Base
  has_many :products
  has_many :pos, class_name: 'POS'
  has_many :distributors, through: :pos

  has_one :address, as: :addressable

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites

  accepts_nested_attributes_for :address

  scope :international, -> { where( international: true ) }
  scope :local, -> { where( international: false ) }
end
