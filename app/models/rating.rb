class Rating < ActiveRecord::Base
  attr_accessible :rating, :description, :user_id, :username
  belongs_to :product
end
