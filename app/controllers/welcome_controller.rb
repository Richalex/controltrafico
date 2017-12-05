class WelcomeController < ApplicationController
  def index
    bus = Bus.all.size
    chofer= Chofer.all.size
    asignacion = Asignacion.all.size
    empresa = Empresa.all.size

    @datos = [bus,chofer,asignacion,empresa]

  end
end
