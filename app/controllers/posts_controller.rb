class PostsController < ApplicationController
  def index
  end
  
  def show
  end

  def new
  end

  def create
    @convo_id = params[:post][:convo_id]
	@convo = Convo.find_by_id(@convo_id)
	@post = current_user.posts.create(params[:post])
	
    #create a new entry in ConvoUser the first time joining a conversation and sets current_turn
	if ConvoUser.find_by_user_id_and_convo_id(current_user.id, @convo_id).nil?
	  ConvoUser.new(:user_id => current_user.id, :convo_id => @convo_id, :creator => false).save
	  # set current turn
	  @creator_id = ConvoUser.find_by_convo_id_and_creator(@convo_id, true).user_id
	  @convo.update_attributes(:current_turn => @creator_id, :start_time => @post.created_at)
	#otherwise update current_turn
	else
	  # current_turn = !current_user
	  @convousers = ConvoUser.find_all_by_convo_id(@convo_id)
	  @convousers.each do |convouser|
	    @convo.update_attributes(:current_turn => convouser.user_id) if current_user.id != convouser.user_id
	  end
	end
	redirect_to convo_path(@convo_id)
  end

end
