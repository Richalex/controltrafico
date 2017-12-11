class Ruta < ApplicationRecord
  self.table_name = 'rutas'
  validates_presence_of :descripcion, message: " No Puede Estar En Blanco"
  validates_presence_of :recorrido, message: " No Puede Estar En Blanco"
  validates_presence_of :id_empresa, message: " No Puede Estar En Blanco"
  validates_presence_of :id_horario, message: " No Puede Estar En Blanco"
end
