class ConvosController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @convos = Convo.all
  end

end
