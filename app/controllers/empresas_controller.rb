class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @empresa = Empresa.all
  end

  # Crear nuevo
  def nuevo
    @empresa = Empresa.new
  end
  def crear
    @empresa=Empresa.new(empresa_params)
    respond_to do |format|
      if @empresa.save
        format.html {redirect_to @empresa,notice: 'Se Agrego Una Nueva Empresa'}
      else
        format.html{render :nueva_empresa_path}
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
      if @empresa.update(empresa_params)
        format.html{redirect_to @empresa, notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @empresa.destroy
    flash[:notice] = 'Se Borro Con Existo'
  rescue ActiveRecord::StatementInvalid => error
    flash[:notice] = 'No Se Puede Borrar Porque Esta Siendo Usado'
  end
    respond_to do |format|
      format.html {redirect_to @empresa}
    end
  end

  private
  # Inicializar Chofer
  def set_empresa
    @empresa = Empresa.find(params[:id])
  end
  # Establecer Parametros
  def empresa_params
    params.require(:empresa).permit(:rut, :nombre, :id_ruta)
  end
end

