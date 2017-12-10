class BusesController < ApplicationController
  before_action :set_bus, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @bus = Bus.all
  end

  # Crear nuevo
  def nuevo
    @bus = Bus.new
    @categorias = CategoriaBus.all
  end
  def crear
    @bus=Bus.new(bus_params)

    respond_to do |format|
      if @bus.save
        format.html {redirect_to @bus,notice: 'Se Agrego Un Nuevo Bus'}
      else
        format.html {redirect_to nuevo_bus_path}
      end
    end
  end

  # Mostrar
  def mostrar
  end
  # Actualizar/Editar
  def editar
    @categorias = CategoriaBus.all
  end
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html{redirect_to @bus, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @bus.destroy
    flash[:notice] = 'Se Borro Con Existo'
  rescue ActiveRecord::StatementInvalid => error
    flash[:notice] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @bus}
    end
  end

  private
  # Inicializar Bus
  def set_bus
    @bus = Bus.find(params[:id])
  end
  # Establecer Parametros
  def bus_params
    params.require(:bus).permit(:num_maquina, :placa_patente, :anio_vehiculo, :marca, :carroceria,:numero_motor,:numero_chasis,:id_categoria)
  end
end
