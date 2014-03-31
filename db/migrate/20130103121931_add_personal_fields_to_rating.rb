class AddPersonalFieldsToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :username, :string
  end
end
