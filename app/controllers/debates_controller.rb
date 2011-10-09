class DebatesController < ApplicationController
  def show
	@debate = Debate.find(params[:id])
  end
  
  def new
	@title = "Instance Variable Defined in New Action in DebatesController"
	@debate = Debate.new
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
  
  def edit
	@title = "Edit debate"
	@debate = Debate.find(params[:id])
  end
  
  def update
	@debate = Debate.find(params[:id])
	if @debate.update_attributes(params[:debate])
		redirect_to @debate
	else
		@title = "Edit debate, this is from inside create action"
		render 'edit'
	end
  end
	
end
