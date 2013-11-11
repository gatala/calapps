module SessionsHelper
	def sign_in(user) 
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
    !current_user.nil?
  end

  def sign_out
  	self.current_user = nil
  	cookies.delete(:remember_token)
  end

	def current_user=(user)
		@current_user = user
	end

	def current_user
    remember_token = User.encrypt(cookies[:remember_token])
   	@current_user ||= User.where(remember_token: remember_token).first
  end

  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	session.delete(:return_to)
  end

  def store_location
  	session[:return_to] = request.url if request.get?
  end

  def is_admin?
    signed_in? && @current_user.is_admin
  end

  def is_owner?
    signed_in? && @current_user.email == @calapp.user_email
  end
end
