class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.integer :num_maquina
      t.string :placa_patente
      t.integer :anio_vehiculo
      t.string :marca
      t.string :carroceria
      t.string :numero_motor
      t.string :numero_chasis
      t.integer :id_categoria

      t.timestamps
    end
  end
end
