class Shop < Product
  is_impressionable :counter_cache => true
  attr_accessible :lat, :lon, :address
end
