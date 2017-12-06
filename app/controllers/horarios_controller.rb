class HorariosController < ApplicationController
  before_action :set_horario, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @horario = Horario.all
  end

  # Crear nuevo
  def nuevo
    @horario = Horario.new
  end
  def crear
    @horario= Horario.new(horario_params)
    respond_to do |format|
      if @horario.save
        format.html {redirect_to @horario,notice: 'Se Agrego Una Nueva Empresa'}
      else
        format.html {redirect_to nuevo_horario_path}
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar

  end
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html{redirect_to @horario, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    @horario.destroy
    respond_to do |format|
      format.html {redirect_to @horario, notice: 'Eliminada con exito'}
    end
  end

  private
  # Inicializar horario
  def set_horario
    @horario = Horario.find(params[:id])
  end
  # Establecer Parametros
  def horario_params
    params.require(:horario).permit(:dia, :periodo, :hora_inicio,:hora_termino)
  end
end
