class ChangeFechaMorosos < ActiveRecord::Migration[7.0]
  def change
    change_column :morosos, :fecha, :date
  end
end
