class AddOtherColumnsToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :physical_address_number, :string
    add_column :leads, :physical_address_floor, :string
    add_column :leads, :physical_address_building, :string
    add_column :leads, :physical_address_street, :string
    add_column :leads, :physical_address_city, :string
    add_column :leads, :physical_address_county, :string
    add_column :leads, :postal_address_number, :string
    add_column :leads, :postal_address_county, :string
    add_column :leads, :hours, :string
    add_column :leads, :business_target, :string
  end
end
