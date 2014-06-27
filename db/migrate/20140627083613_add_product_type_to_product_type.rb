class AddProductTypeToProductType < ActiveRecord::Migration
  def change
  	add_column :product_types, :parent_product_type_id, :integer
  	add_index :product_types, :parent_product_type_id
  end
end
