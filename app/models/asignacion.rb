class Asignacion < ApplicationRecord
  self.table_name = 'asignaciones'
  has_one :empresa
  has_one :chofer
  has_one :ruta
  has_one :horario
end
