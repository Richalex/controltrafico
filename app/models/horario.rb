class Horario < ApplicationRecord
  validate :Validar_fecha
  validates_presence_of :periodo, message: " No Puede Estar En Blanco"
  validates_presence_of :dia, message: " No Puede Estar En Blanco"
  validates_presence_of :hora_inicio, message: " No Puede Estar En Blanco"
  validates_presence_of :hora_termino, message: " No Puede Estar En Blanco"



  def Validar_fecha

    if Time.parse(hora_inicio.to_s) > Time.parse(hora_termino.to_s)
      errors.add(:hora_inicio," No Puede Estar Despues De La Hora Termino")
    end
  end
end
