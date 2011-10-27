class ConvosController < ApplicationController
  $default_open = 60
  $default_duration = 20
  
  def new
    @convo = Convo.new
  end

  def create
	@convo = Convo.new(params[:convo])
	@convo.end_time = Time.now + 1.day
	# current_user.convos << @convo 
	# ConvoUser.new(:user_id => current_user.id, :convo_id => @convo.id, :creator => true).save
	if current_user.convo_users.create(:creator => true, :convo => @convo)
	  redirect_to @convo
	else
	  render 'new'
	end
  end

  def show
    @convo = Convo.find(params[:id])
	@posts = @convo.posts #Post.find_all_by_convo_id(params[:id])
	@convo_user = ConvoUser.find_by_convo_id_and_user_id(params[:id], current_user.id)
  end

  def index
    @convos = Convo.all
	
	@convos_participating = Array.new
	@convos_join = Array.new
	@convos_watch = Array.new
	@convos_old = Array.new
	
	@convos.each do |convo|
	  @participating = false; convo.users.each {|user| @participating = true if user.id == current_user.id}
	  @open = (Time.now - convo.created_at) <= $default_open*60
	  @enduring = true; @enduring = (Time.now - convo.start_time) <= $default_duration*60 if !convo.start_time.nil?
	  
	  @convos_participating << convo if @participating and @open and @enduring
	  @convos_join << convo if !@participating and convo.start_time.nil? and @open
	  @convos_watch << convo if !@participating and !convo.start_time.nil? and @enduring
	  @convos_old << convo if !@open or !@enduring
	end
		
  end

end
