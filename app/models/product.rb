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
  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites
  has_many :pictures, as: :imageable

  alias_attribute :category, :sub_category # .category method
  alias_attribute :characteristics, :attrs # .characteristics method

  delegate :name, to: :company, prefix: true # .company_name method
  delegate :name, to: :category, prefix: true # .category_name method
  delegate :count, to: :photos, prefix: true # .photos_count method
  delegate :count, to: :videos, prefix: true # .videos_count method
  delegate :distributors, to: :company, allow_nil: true # .distributors method

  accepts_nested_attributes_for :attrs, allow_destroy: true
  accepts_nested_attributes_for :prices, allow_destroy: true
  accepts_nested_attributes_for :dimensions, allow_destroy: true
  accepts_nested_attributes_for :pictures, allow_destroy: true

  def title
    "#{name} - #{category_name}"
  end

  def price_string
    prices.first.try(:title) # TODO: select a proper price record
  end

  def rating
    [ratings.average(:value).to_i, 5].min
  end

  cattr_reader :default_picture do
    OpenStruct.new url: 'thumb-img-1.jpg', title: 'No images found'
  end
  default_picture.deep_freeze

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
