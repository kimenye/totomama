class ChangeNameOfColumnsOnLead < ActiveRecord::Migration
  def change
    rename_column :leads, :type, :business_type
  end
end
