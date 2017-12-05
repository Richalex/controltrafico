class AddIdRutaToAsignaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :asignaciones, :id_ruta, :integer
    add_column :asignaciones, :id_horario, :integer
  end
end
