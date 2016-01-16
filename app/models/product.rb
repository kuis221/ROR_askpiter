class Product < ActiveRecord::Base
  belongs_to :company
  belongs_to :sub_category
  has_many :videos
  has_many :photos
  has_many :prices
  has_many :attrs, class_name: "Attribute"
  has_many :ratings
  has_many :reviews
  has_many :dimensions
  has_many :favourite_products
  has_many :users, through: :favourite_products
  has_many :pictures, as: :imageable

  def self.search(search, category_id)
    if search || category_id
      prods = all
      prods = prods.where('name LIKE :search or description LIKE :search', search: "%#{search}%") if search
      prods = prods.where(sub_category_id: category_id) if category_id
    else
      all
    end
  end
end
