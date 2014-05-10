class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.



  def confirm_logged_in
    if !session[:user_id]
      redirect_to controller: 'users' , action: 'login'
      false
    else
      true
    end
  end


  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by_auth_token(token)
    end
  end

end
