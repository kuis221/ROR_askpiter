class Photo < ActiveRecord::Base
  include Recentable

  belongs_to :product
  belongs_to :user
  belongs_to :category

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites
  has_one :picture, as: :imageable

  delegate :url, :title, to: :picture, allow_nil: true # .url and .title methods

  accepts_nested_attributes_for :picture

  def self.add_billet
    new main: false, day: false, picture: Picture.new
  end
end
