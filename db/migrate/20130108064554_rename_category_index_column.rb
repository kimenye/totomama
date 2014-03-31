class RenameCategoryIndexColumn < ActiveRecord::Migration
  def up
    rename_column :categories, :index, :order
  end

  def down
    rename_column :categories, :order, :index
  end
end
