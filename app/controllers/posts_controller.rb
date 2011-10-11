class PostsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
  end

  def create
    current_user.posts.create(params[:post])
	redirect_to convo_path(params[:post][:convo_id])
	
	#create a new entry in ConvoUser the first time joining a conversation
	if ConvoUser.find_by_user_id_and_convo_id(current_user.id, params[:post][:convo_id]).nil?
	  ConvoUser.new(:user_id => current_user.id, :convo_id => params[:post][:convo_id], :creator => false).save
	end
  end

end
