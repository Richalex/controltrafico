class CategoriasController < ApplicationController
  def index
    @categorias = CategoriaBus.all
  end
end
