class AddFieldsToLead < ActiveRecord::Migration
  def change
    add_column :leads, :type, :string
    add_column :leads, :website, :string
  end
end
