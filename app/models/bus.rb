class Bus < ApplicationRecord
  validates_format_of :placa_patente,
                      :with => /\A([A-Z,a-z]{4}\d{2}|[A-Z,a-z]{2}\d{4})\Z/i,
                      :message => "no válido."

end
