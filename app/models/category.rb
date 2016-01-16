class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
  has_many :videos
  has_many :photos

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites

  def contains_sub_category?(category_id)
    SubCategory.find_by_id(category_id).category_id == self.id
  end
end
