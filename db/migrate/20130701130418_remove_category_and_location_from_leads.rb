class RemoveCategoryAndLocationFromLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :category
    remove_column :leads, :location
  end
end
