class Category < ActiveRecord::Base
  attr_accessible :description, :order, :name, :stage_id
  belongs_to :stage
  has_many :products, :through => :product_categories
  has_many :product_categories
end
