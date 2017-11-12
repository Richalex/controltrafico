class ChoferesController < ApplicationController
  def index
    @choferes = Chofer.all
  end
end
