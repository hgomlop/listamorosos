class ChangeDeudaMorosos < ActiveRecord::Migration[7.0]
  def change
    change_column :morosos, :deuda, :string
  end
end
