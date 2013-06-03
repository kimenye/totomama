class Lead < ActiveRecord::Base
  attr_accessible :category, :email, :location, :name, :phone_number, :type, :website
end
