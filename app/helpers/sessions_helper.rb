module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id]
	self.current_user = user
  end
  
  def current_user=(user)
	@current_user = user
  end
  
  def current_user
	@current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
	cookies.delete(:remember_token)
	self.current_user = nil
  end
  
  private
  
    def user_from_remember_token
	  user = User.find_by_id(cookies.signed[:remember_token])
	  return nil if user.nil?
	  return user
	end
  
end
