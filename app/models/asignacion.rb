class Asignacion < ApplicationRecord
  self.table_name = 'asignaciones'

  validates_presence_of :id_chofer, message: " No Puede Estar En Blanco"
  validates_presence_of :id_empresa, message: " No Puede Estar En Blanco"
  validates_presence_of :id_bus, message: " No Puede Estar En Blanco"
  validates_presence_of :id_ruta, message: " No Puede Estar En Blanco"
  validates_presence_of :id_horario, message: " No Puede Estar En Blanco"

  validates_uniqueness_of :id_bus,
                          message: "Bus Ya Asignado"
  validates_uniqueness_of :id_chofer,
                          message: "Chofer ya Asignado"

end
