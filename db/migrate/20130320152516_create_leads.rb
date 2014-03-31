class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
