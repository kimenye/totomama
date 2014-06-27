class RenameProductTypeFields < ActiveRecord::Migration
  def change
  	rename_column :product_types, :product_type, :name
  end
end
