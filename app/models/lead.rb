class Lead < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :phone_number
  validates_presence_of :business_type
  validates_presence_of :category

  attr_accessible :category, :email, :location, :name, :phone_number, :business_type, :website
end
