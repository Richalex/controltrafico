class CreateEmpresas < ActiveRecord::Migration[5.1]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :rut
      t.integer :id_ruta

      t.timestamps
    end
  end
end
