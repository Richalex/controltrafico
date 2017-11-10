class CreateAsignacions < ActiveRecord::Migration[5.1]
  def change
    create_table :asignacions do |t|
      t.integer :id_chofer
      t.integer :id_bus
      t.integer :id_empresa

      t.timestamps
    end
  end
end
