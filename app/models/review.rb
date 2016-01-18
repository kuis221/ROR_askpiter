class Review < ActiveRecord::Base
  include Recentable

  belongs_to :language
  belongs_to :user
  belongs_to :product

  delegate :name, to: :user, prefix: true # .user_name method

  def date_string
    created_at.to_date.to_s(:long)
  end
end
