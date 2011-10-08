class DebatesController < ApplicationController
  def show
	@debate = Debate.find(params[:id])
  end
  
  def new
	@title = "Instance Variable Defined in New Action in DebatesController"
  end

end
