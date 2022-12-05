class CreateMorosos < ActiveRecord::Migration[7.0]
  def change
    create_table :morosos do |t|
      t.string :nombre
      t.string :apellido
      t.decimal :deuda
      t.datetime :fecha
      t.string :direccion

      t.timestamps
    end
  end
end
