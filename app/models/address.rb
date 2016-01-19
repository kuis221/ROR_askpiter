class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  def full_address
    "#{street}, #{city}"
  end
  geocoded_by :full_address
  after_validation :geocode
end
