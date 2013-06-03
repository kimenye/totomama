class Lead < ActiveRecord::Base
  attr_accessible :category, :email, :location, :name, :phone_number, :business_type, :website
end
