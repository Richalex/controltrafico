class HorariosController < ApplicationController
  before_action :set_horario, only: [:editar,:update, :mostrar, :eliminar]
  before_action :set_timezone
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
      if @horario.valid?
        if @horario.save
          format.html { redirect_to @horario, notice: 'Horario Creado Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @horario }
        else
          format.html { render :nuevo }
          format.json { render json: @horario.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
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
    begin
    @horario.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @horario}
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
  def set_timezone
    Time.zone = 'Santiago'
  end
end
