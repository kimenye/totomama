class Shop < Product
  acts_as_gmappable :lat => "lat", :lng => "lon", :process_geocoding => false
  attr_accessible :lat, :lon, :address
  def gmaps4rails_address
    "#{self.lat}, #{self.lon}"
  end
end
