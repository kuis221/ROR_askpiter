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

  def self.base_search(search, category_id, sub_category_id, company_id)
    prods = all
    if search || category_id || sub_category_id || company_id
      prods = prods.where('products.name LIKE :search or products.description LIKE :search', search: "%#{search}%") if search
      prods = prods.joins(:sub_category).where('sub_categories.category_id = ?', category_id) if category_id
      prods = prods.where(sub_category_id: sub_category_id) if sub_category_id
      prods = prods.where(company_id: company_id) if company_id
      prods
    end
    prods
  end

  def self.search( search, category_id, sub_category_id, company_id, start_row_index, take_count )
    prods = self.base_search( search, category_id, sub_category_id, company_id ).offset( start_row_index ).limit( take_count )
  end

  def self.search_count( search, category_id, sub_category_id, company_id )
    prods = self.base_search( search, category_id, sub_category_id, company_id ).count
  end
end
