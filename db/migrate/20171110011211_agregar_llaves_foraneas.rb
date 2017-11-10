class AgregarLlavesForaneas < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :buses, :categoria_buses, column: :id_categoria, primary_key: :id
    add_foreign_key :empresas, :rutas, column: :id_ruta, primary_key: :id
    add_foreign_key :rutas, :horarios, column: :id_horario, primary_key: :id
    add_foreign_key :rutas, :empresas, column: :id_empresa, primary_key: :id
    add_foreign_key :asignaciones, :choferes, column: :id_chofer, primary_key: :id
    add_foreign_key :asignaciones, :buses, column: :id_bus, primary_key: :id
    add_foreign_key :asignaciones, :empresas, column: :id_empresa, primary_key: :id
  end
end
