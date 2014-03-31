class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :admin
      t.string :title
      t.text :content
      t.string :status
      t.references :category

      t.timestamps
    end
    add_index :articles, :admin_id
    add_index :articles, :category_id
  end
end
