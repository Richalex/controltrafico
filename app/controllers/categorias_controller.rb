class CategoriasController < ApplicationController
  before_action :set_categoria, only: [:editar,:update, :mostrar, :eliminar]

  def index
    @categoria = CategoriaBus.all
  end

  # Crear nuevo
  def nuevo
    @categoria = CategoriaBus.new
  end
  def crear
    @categoria = CategoriaBus.new(categoria_params)
    respond_to do |format|
      if @categoria.valid?
        if @categoria.save
          format.html { redirect_to @categoria, notice: 'Categoria Creada Satisfactoriamente' }
          format.json { render :mostrar, status: :created, location: @categoria }
        else
          format.html { render :nuevo }
          format.json { render json: @categoria.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :nuevo }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
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
      if @categoria.update(categoria_params)
        format.html{redirect_to update_categoria_path(@categoria), notice:'Se Edito Con Exito'}
      else
        render :editar
      end
    end
  end

  # Eliminar
  def eliminar
    begin
    @categoria.destroy
      flash[:success] = 'Se Borro Con Existo'
    rescue ActiveRecord::StatementInvalid => error
      flash[:danger] = 'No Se Puede Borrar Porque Esta Siendo Usado'
    end
    respond_to do |format|
      format.html {redirect_to categorias_path}
    end
  end

  private
  # Inicializar categoria
  def set_categoria
    @categoria = CategoriaBus.find(params[:id])
  end
  # Establecer Parametros
  def categoria_params
    params.require(:categoria_bus).permit(:descripcion,:nombre)
  end
end
