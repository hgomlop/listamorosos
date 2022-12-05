class AddUserIdToMorosos < ActiveRecord::Migration[7.0]
  def change
    add_column :morosos, :user_id, :integer
    add_index :morosos, :user_id
  end
end
