class RutasController < ApplicationController
  before_action :set_ruta, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @ruta = Ruta.all
    @horario=Horario.all
  end

  # Crear nuevo
  def nuevo
    @ruta = Ruta.new
    @empresa=Empresa.all
    @horario=Horario.all
  end
  def crear
    @empresa=Empresa.all
    @horario=Horario.all
    @ruta=Ruta.new(ruta_params)
    respond_to do |format|
      if @ruta.valid?
        if @ruta.save
          format.html { redirect_to @ruta, notice: 'ruta Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @ruta }
        else
          format.html { render :nuevo }
          format.json { render json: @ruta.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @ruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar
    @empresa=Empresa.all
    @horario=Horario.all
  end
  def update
    respond_to do |format|
      if @ruta.update(ruta_params)
        format.html{redirect_to update_ruta_path(@ruta), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @ruta.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @ruta}
    end
  end

  private
  # Inicializar Ruta
  def set_ruta
    @ruta = Ruta.find(params[:id])

  end
  # Establecer Parametros
  def ruta_params
    params.require(:ruta).permit(:descripcion, :recorrido, :id_empresa, :id_horario)
  end
end
