class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    # If there are no user, what ever get type into the login gonna turn into a new user
    if User.count == 0 
      User.create_starter_user_with(params[:name], params[:password])
    end
    
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end
