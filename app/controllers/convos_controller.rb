class ConvosController < ApplicationController
  def new
    @convo = Convo.new
  end

  def create
	@convo = Convo.new(params[:convo])
	# if @convo.save
	# if current_user.convos << @convo
	if current_user.convo_users.create(:creator => true, :convo => @convo)
	  # ConvoUser.new(:user_id => current_user.id, :convo_id => @convo.id, :creator => true).save
	  redirect_to @convo
	else
	  render 'new'
	end
  end

  def show
  end

  def index
    @convos = Convo.all
  end

end
