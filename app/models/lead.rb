class Lead < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :phone_number
  validates_presence_of :business_type

  attr_accessible :email, :name, :phone_number, :business_type, :website,
                  :physical_address_number, :physical_address_floor, :physical_address_building,
                  :physical_address_street, :physical_address_city, :physical_address_county,
                  :postal_address_number, :postal_address_county, :hours, :business_target,
                  :description
end