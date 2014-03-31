class AddTimeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :time, :timestamp
  end
end
