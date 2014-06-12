class ProductType < ActiveRecord::Base
  attr_accessible :product_type
  has_many :products, :through => :product_type_products
  has_many :product_type_products
end
