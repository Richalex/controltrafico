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
    @ruta=Ruta.new(ruta_params)
    respond_to do |format|
      if @ruta.save
        format.html {redirect_to rutas_path(@ruta),notice: 'Se Agrego Una Nueva Ruta'}
      else
        format.html{redirect_to :nueva_ruta_path}
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
    flash[:notice] = 'Se Borro Con Existo'
  rescue ActiveRecord::StatementInvalid => error
    flash[:notice] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @ruta, notice: 'Eliminada con exito'}
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
