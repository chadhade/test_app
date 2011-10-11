class PostsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
  end

  def create
    @convo_id = params[:post][:convo_id]
	
	current_user.posts.create(params[:post])
	redirect_to convo_path(@convo_id)
	
    #create a new entry in ConvoUser the first time joining a conversation and sets current_turn
	if ConvoUser.find_by_user_id_and_convo_id(current_user.id, @convo_id).nil?
	  ConvoUser.new(:user_id => current_user.id, :convo_id => @convo_id, :creator => false).save
	  # set current turn
	  @creator_id = ConvoUser.find_by_convo_id_and_creator(@convo_id, true).user_id
	  Convo.find_by_id(@convo_id).update_attributes(:current_turn => @creator_id)
	end
  end

end
