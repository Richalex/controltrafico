class ChoferesController < ApplicationController
  before_action :set_chofer, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @chofer = Chofer.all
  end

  # Crear nuevo
  def nuevo
    @chofer = Chofer.new
  end
  def crear
    @chofer=Chofer.new(chofer_params)
    respond_to do |format|
      if @chofer.save
        format.html {redirect_to choferes_path(@chofer),notice: 'Se Agrego Un Nuevo Chofer'}
      else
        format.html{render :nuevo_chofer_path}
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
      if @chofer.update(chofer_params)
        format.html{redirect_to update_chofer_path(@chofer), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    @chofer.destroy
    respond_to do |format|
      format.html {redirect_to choferes_path, notice: 'Eliminado con exito'}
    end
  end

  private
  # Inicializar Chofer
  def set_chofer
    @chofer = Chofer.find(params[:id])
  end
  # Establecer Parametros
  def chofer_params
    params.require(:chofer).permit(:rut, :nombres, :apellido_pat, :apellido_mat, :fecha_ingreso)
  end
end
