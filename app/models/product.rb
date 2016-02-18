class Product < ActiveRecord::Base
  include Recentable

  belongs_to :company
  belongs_to :sub_category, inverse_of: :products
  has_one :category, through: :sub_category

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
  has_many :similars, -> (p) { where.not(id: p) }, through: :sub_category, source: :products

  alias_attribute :characteristics, :attrs # .characteristics method

  delegate :name, to: :company, prefix: true # .company_name method
  delegate :name, to: :sub_category, prefix: true # .sub_category_name method
  delegate :count, to: :photos, prefix: true # .photos_count method
  delegate :count, to: :videos, prefix: true # .videos_count method
  delegate :count, to: :similars, prefix: true # .similars_count method
  delegate :distributors, to: :company, allow_nil: true # .distributors method
  delegate :title, to: :picture, prefix: true, allow_nil: true # .picture_url, .picture_title

  accepts_nested_attributes_for :attrs, allow_destroy: true
  accepts_nested_attributes_for :prices, allow_destroy: true
  accepts_nested_attributes_for :dimensions, allow_destroy: true
  accepts_nested_attributes_for :pictures, allow_destroy: true

  def title
    "#{name} - #{sub_category_name}"
  end

  def date_string
    created_at.to_date.to_s(:rfc822)
  end

  def price_string
    prices.first.try(:title) # TODO: select a proper price record
  end

  def rating
    [ratings.average(:value).to_i, 5].min
  end

  def picture
    pictures.recent.first || default_picture
  end

  def picture_url *args
    args.clear if picture == default_picture
    picture.url *args
  end

  def self.media
    media = []
    media += Photo.where(product_id:self.ids)
    media += Video.where(product_id:self.ids)
    media
  end

  cattr_reader :default_picture do
    OpenStruct.new url: 'thumb-img-1.jpg', title: 'No images found'
  end
  default_picture.deep_freeze

  def self.base_search(search, sub_categories, companies)
    prods = all
    if search || sub_categories.is_a?(Array) || companies.is_a?(Array)
      prods = prods.where('products.name LIKE :search or products.description LIKE :search', search: "%#{search}%") if search
      prods = prods.where(sub_category_id: sub_categories) if sub_categories.is_a?(Array)
      prods = prods.where(company_id: companies) if companies.is_a?(Array)
      prods
    end
    prods
  end

  def self.search( search, sub_categories, companies, start_row_index, take_count )
    prods = self.base_search( search, sub_categories, companies ).offset( start_row_index ).limit( take_count )
  end

  def self.search_count( search, sub_categories, companies )
    prods = self.base_search( search, sub_categories, companies ).count
  end
end
