class Category < ActiveRecord::Base
  attr_accessible :description, :order, :name, :stage_id
  belongs_to :stage
end
