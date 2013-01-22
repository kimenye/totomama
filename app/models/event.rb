class Event < Shop
  is_impressionable :counter_cache => true
  attr_accessible :time
end
