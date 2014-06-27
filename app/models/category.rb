class Category < ActiveRecord::Base
  attr_accessible :description, :order, :name, :stage_id
  belongs_to :stage
  has_many :products, :through => :product_categories
  has_many :product_categories
  belongs_to :parent_category, class_name: "Category"
  has_many :categories, :foreign_key => "parent_category_id"
end
