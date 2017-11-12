class EmpresasController < ApplicationController
  def index
    @empresas = Empresa.all
  end
end
