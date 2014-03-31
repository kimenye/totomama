class LinkStageToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :stage_id, :integer
    add_index :categories, :stage_id
  end
end
