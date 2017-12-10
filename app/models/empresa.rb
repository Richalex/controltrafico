class Empresa < ApplicationRecord
  validates_format_of :rut,
                      :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i,
                      :message => "no válido."
end
