class AsignacionesController < ApplicationController
  def index
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
    @asignaciones = Asignacion.all
  end


end
