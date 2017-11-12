class HorariosController < ApplicationController
  def index
    @horarios = Horario.all
  end
end
