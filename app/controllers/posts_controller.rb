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
  end

end
