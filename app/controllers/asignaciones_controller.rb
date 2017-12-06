class AsignacionesController < ApplicationController
  def index
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
    @asignaciones = Asignacion.all
  end

  # Crear nuevo
  def nuevo
    @asignacion= Asignacion.new
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
  end
  def crear

    @asignacion=Asignacion.new(asignacion_params)
    respond_to do |format|
      if @asignacion.save
        format.html {redirect_to @asignacion,notice: 'Se Agrego Un Nueva Asignación'}
      else
        format.html {redirect_to nuevo_asignacion_path}
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
      if @asignacion.update(asignacion_params)
        format.html{redirect_to @asignacion, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    @asignacion.destroy
    respond_to do |format|
      format.html {redirect_to @asignacion, notice: 'Eliminada con exito'}
    end
  end

  private
  # Inicializar asignacion
  def set_asignacion
    @asignacion = Asignacion.find(params[:id])
  end
  # Establecer Parametros
  def asignacion_params
    params.require(:asignacion).permit(:id_chofer,:id_bus, :id_horario, :id_empresa,:id_ruta)
  end

end
