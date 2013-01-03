class Rating < ActiveRecord::Base
  attr_accessible :rating, :description, :user_id
  belongs_to :product
end
