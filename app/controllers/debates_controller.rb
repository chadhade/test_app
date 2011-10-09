class DebatesController < ApplicationController
  def show
	@debate = Debate.find(params[:id])
  end
  
  def new
	@title = "Instance Variable Defined in New Action in DebatesController"
	@debate = Debate.new
  end

end
