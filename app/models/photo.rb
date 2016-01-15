class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :category
end
