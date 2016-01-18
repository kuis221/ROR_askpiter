class Picture < ActiveRecord::Base
  include Recentable
  belongs_to :imageable, polymorphic: true
end
