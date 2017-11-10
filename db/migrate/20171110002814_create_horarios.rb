class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.string :dia
      t.string :periodo
      t.datetime :hora_inicio
      t.datetime :hora_termino

      t.timestamps
    end
  end
end
