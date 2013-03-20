class Lead < ActiveRecord::Base
  attr_accessible :category, :email, :location, :name, :phone_number
end
