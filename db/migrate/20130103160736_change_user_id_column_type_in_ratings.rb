class ChangeUserIdColumnTypeInRatings < ActiveRecord::Migration
  def up
    change_column :ratings, :user_id, :string
  end

  def down
    change_column :ratings, :user_id, :integer
  end
end
