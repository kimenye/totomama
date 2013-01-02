class AddImpressionsFieldAndStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :impressions_count, :integer
    add_column :products, :active, :boolean
  end
end
