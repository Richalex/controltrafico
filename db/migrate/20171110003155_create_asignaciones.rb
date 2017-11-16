class CreateAsignaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :asignaciones do |t|
      t.integer :id_chofer
      t.integer :id_bus
      t.integer :id_empresa

      t.timestamps
    end
  end
end
