class AsignacionesController < ApplicationController
  def index
    @chofer = Chofer.all
    @bus = Bus.all
    @asignaciones = Asignacion.all
  end


end
