class Ruta < ApplicationRecord
  self.table_name = 'rutas'
  belongs_to :empresa
end
