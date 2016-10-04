class SessionsController < ApplicationController
  def log_in
  	@attempt = params[:user]
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user[:id]
      redirect_to "/users/show/#{@user.id}"
      
    else
      flash[:error] = "Invalid"
      redirect_to '/sessions/new'
    end
  end

  def log_out
  	session = nil
  	rediret_to '/users/new'
  end
end
