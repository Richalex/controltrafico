class AddMasLlavesForaneas < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :asignaciones, :rutas, column: :id_ruta, primary_key: :id
    add_foreign_key :asignaciones, :horarios, column: :id_horario, primary_key: :id
  end
end
