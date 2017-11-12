class RutasController < ApplicationController
  def index
    @rutas = Ruta.all
  end
end
