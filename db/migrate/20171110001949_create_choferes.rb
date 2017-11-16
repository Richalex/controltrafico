class CreateChoferes < ActiveRecord::Migration[5.1]
  def change
    create_table :choferes do |t|
      t.string :rut
      t.string :nombres
      t.string :apellido_pat
      t.string :apellido_mat
      t.date :fecha_ingreso

      t.timestamps
    end
  end
end
