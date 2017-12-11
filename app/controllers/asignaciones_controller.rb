class AsignacionesController < ApplicationController
  before_action :set_asignacion, only: [:editar,:update, :mostrar, :eliminar]
  def index
    @asignacion = Asignacion.all
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
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
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
    @asignacion = Asignacion.new(asignacion_params)
    respond_to do |format|
      if @asignacion.valid?
        if @asignacion.save
          format.html { redirect_to @asignacion, notice: 'Asignacion Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @asignacion }
        else
          format.html { render :nuevo }
          format.json { render json: @asignacion.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @asignacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar
    @chofer = Chofer.all
    @bus = Bus.all
    @empresa = Empresa.all
    @horario = Horario.all
    @ruta = Ruta.all
  end
  def update
    respond_to do |format|
      if @asignacion.update(asignacion_params)
        format.html{redirect_to @asignacion, flash[:success] = 'Se Edito Con Exito'}
      else
        format.html{render :editar}
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @asignacion.destroy
    flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @asignacion}
    end
  end

  private
  # Inicializar asignacion
  def set_asignacion
    @asignacion = Asignacion.find(params[:id])
  end
  # Establecer Parametros
  def asignacion_params
    params.require(:asignacion).permit(:id_chofer, :id_bus, :id_horario, :id_empresa, :id_ruta)
  end

end
