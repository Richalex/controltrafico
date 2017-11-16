class CreateRutas < ActiveRecord::Migration[5.1]
  def change
    create_table :rutas do |t|
      t.string :descripcion
      t.string :recorrido
      t.integer :id_empresa
      t.integer :id_horario

      t.timestamps
    end
  end
end
