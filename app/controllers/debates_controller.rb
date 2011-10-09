class DebatesController < ApplicationController
  def show
	@debate = Debate.find(params[:id])
  end
  
  def create
	@debate = Debate.new(params[:debate])
	if @debate.save
		redirect_to @debate
	else
		@title = "Create new debate, this is from inside create action"
		render 'new'
	end
  end
  
  def new
	@title = "Instance Variable Defined in New Action in DebatesController"
	@debate = Debate.new
  end

end
