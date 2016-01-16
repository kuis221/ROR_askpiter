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
  has_many :favourites, as: :favouriteable
  has_many :favourite_categories
  has_many :categories, through: :favourite_categories
  has_many :favourite_videos
  has_many :favourited_videos, through: :favourite_videos, source: :video
  has_many :videos
  has_many :photos
  has_many :favourite_photos
  has_many :favourited_photos, through: :favourite_photos, source: :photo

  has_many :reviews
  has_many :searches
  has_many :favourite_companies
  has_many :companies, through: :favourite_companies
  has_many :favourite_products
  has_many :products, through: :favourite_products
  has_one :picture, as: :imageable

end
