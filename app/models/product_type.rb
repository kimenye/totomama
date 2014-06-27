class ProductType < ActiveRecord::Base
  attr_accessible :name, :parent_product_type_id
  has_many :products, :through => :product_type_products
  has_many :product_type_products
  belongs_to :parent_product_type, class_name: "ProductType"
  has_many :product_types, :foreign_key => "parent_product_type_id"
end
