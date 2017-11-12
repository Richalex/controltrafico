class AsignacionesController < ApplicationController
  def index
    @asignaciones = Asignacion.all
  end
end
