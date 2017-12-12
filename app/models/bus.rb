class Bus < ApplicationRecord
  validates_format_of :placa_patente,
                      :with => /\A([A-Z,a-z]{4}\d{2}|[A-Z,a-z]{2}\d{4})\Z/i,
                      :message => " No Valida (XXXX00-XX0000)"

  validates_presence_of :num_maquina, message: " No Puede Estar En Blanco"
  validates_presence_of :anio_vehiculo, message: " No Puede Estar En Blanco"
  validates_presence_of :placa_patente, message: " No Puede Estar En Blanco"
  validates_presence_of :numero_motor, message: " No Puede Estar En Blanco"
  validates_presence_of :numero_chasis, message: " No Puede Estar En Blanco"
  validates_presence_of :carroceria, message: " No Puede Estar En Blanco"
  validates_presence_of :marca, message: " No Puede Estar En Blanco"


  validates_uniqueness_of :placa_patente,
                          message: " Ya Ingresado"
  validates_uniqueness_of :num_maquina,
                          message: " Ya Ingresado"
  validates_uniqueness_of :numero_motor,
                          message: " Ya Ingresado"
  validates_uniqueness_of :numero_chasis,
                          message: " Ya Ingresado"
end
