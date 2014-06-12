class CreateProductTypeProducts < ActiveRecord::Migration
  def change
    create_table :product_type_products do |t|
      t.references :product_type
      t.references :product

      t.timestamps
    end
    add_index :product_type_products, :product_type_id
    add_index :product_type_products, :product_id
  end
end
