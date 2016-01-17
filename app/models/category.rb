class Category < ActiveRecord::Base
  belongs_to :father_category
  has_many :sub_categories
  has_many :videos
  has_many :photos

  has_many :user_favourites, as: :favouriteable
  has_many :users, through: :user_favourites

  def searched_for?(category_id, sub_category_id)
    return false if category_id.nil? && sub_category_id.nil?
    return true if !category_id.nil? && category_id.to_i == self.id
    return true if !sub_category_id.nil? && sub_categories.where(category_id: sub_category_id).any? 
    false
  end
end
