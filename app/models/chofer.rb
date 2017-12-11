class Chofer < ApplicationRecord
  validate :Validar_fecha
  validates_uniqueness_of :rut, message: " Actualmente Ingresado"
  validates_presence_of :nombres, message: " No Puede Estar En Blanco"
  validates_presence_of :rut, message: " No Puede Estar En Blanco"
  validates_presence_of :apellido_pat, message: " No Puede Estar En Blanco"
  validates_presence_of :apellido_mat, message: " No Puede Estar En Blanco"
  validates_presence_of :fecha_ingreso, message: " No Puede Estar En Blanco"




  def Validar_fecha

    if Date.parse(fecha_ingreso.to_s) > Date.today
      errors.add(:fecha_ingreso," No Puede Estar En El Futuro")
    end
  end
end
