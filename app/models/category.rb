class Category < ActiveRecord::Base
  attr_accessible :description, :index, :name, :stage_id
  belongs_to :stage
end
