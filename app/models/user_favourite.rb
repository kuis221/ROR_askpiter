class UserFavourite < ActiveRecord::Base

  belongs_to :user
  belongs_to :favouriteable, polymorphic: true

  scope :categories, -> { where( favouriteable_type: 'Category' ) }
  scope :companies, -> { where( favouriteable_type: 'Company' ) }
  scope :products, -> { where( favouriteable_type: 'Product' ) }
  scope :photos, -> { where( favouriteable_type: 'Photo' ) }
  scope :videos, -> { where( favouriteable_type: 'Video' ) }
end
