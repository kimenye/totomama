class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :rating
      t.text :description
      t.references :product

      t.timestamps
    end
    add_index :ratings, :product_id
  end
end
