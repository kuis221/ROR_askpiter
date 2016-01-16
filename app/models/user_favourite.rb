class UserFavourite < ActiveRecord::Base

  belongs_to :user
  belongs_to :favouriteable, polymorphic: true

end
