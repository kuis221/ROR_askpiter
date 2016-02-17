class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  def full_address
    "#{street}, #{city}"
  end
  geocoded_by :full_address,
              & -> (address, result) {address.country_code = result && result.first && result.first.country_code}
  after_validation :geocode
end
