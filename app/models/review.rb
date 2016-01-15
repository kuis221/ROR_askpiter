class Review < ActiveRecord::Base
  belongs_to :language
  belongs_to :user
  belongs_to :product
end
