class AddShopFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :address, :string
    add_column :products, :lat, :float
    add_column :products, :lon, :float
  end
end
