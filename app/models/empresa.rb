class Empresa < ApplicationRecord
  validates_format_of :rut,
                      :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i,
                      :message => "Rut No Valido (000.000.000-X)"

  validates_presence_of :nombre, message: " No Puede Estar En Blanco"
  validates_presence_of :rut, message: " No Puede Estar En Blanco"

  validates_uniqueness_of :nombre,
                          message: " Ya Ingresado"
  validates_uniqueness_of :rut,
                          message: "Rut Ya Ingresado"

end
