class SessionsController < ApplicationController
  def log_in
    @attempt = params[:user]
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user[:id]
      redirect_to "/users/#{@user.id}"
      
    else
      flash[:error] = "Invalid"
      redirect_to '/sessions/new'
    end
  end

  def destroy
  	session = nil
  	redirect_to '/sessions/new'
  end
end
