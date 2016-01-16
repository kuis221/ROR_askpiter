class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :currency
  belongs_to :language
  has_one :address, as: :addressable
  has_many :ratings
  
  has_many :favourites, foreign_key: 'user_id', class_name: 'UserFavourite'
  has_many :favourite_categories, -> { UserFavourite.categories }, class_name: 'UserFavourite'
  has_many :categories, through: :favourite_categories, source: :favouriteable, source_type: 'Category'
  has_many :favourite_companies, -> { UserFavourite.companies }, class_name: 'UserFavourite'
  has_many :companies, through: :favourite_companies, source: :favouriteable, source_type: 'Company'
  has_many :favourite_products, -> { UserFavourite.products }, class_name: 'UserFavourite'
  has_many :products, through: :favourite_products, source: :favouriteable, source_type: 'Product'
  #has_many :favourite_companies, -> { UserFavourites.companies }
  #has_many :companies, through: :favourite_companies
  #has_many :favourite_videos
  #has_many :favourited_videos, through: :favourite_videos, source: :video
  has_many :videos
  has_many :photos
  #has_many :favourite_photos
  #has_many :favourited_photos, through: :favourite_photos, source: :photo

  has_many :reviews
  has_many :searches
  #has_many :companies, through: :favourite_companies
  #has_many :favourite_products
  #has_many :products, through: :favourite_products
  has_one :picture, as: :imageable

  def save_search( search_string )
    searches.build( text: search_string )
    save
  end

end
