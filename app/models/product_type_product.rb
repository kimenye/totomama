class ProductTypeProduct < ActiveRecord::Base
  belongs_to :product_type
  belongs_to :product
  # attr_accessible :title, :body
end
