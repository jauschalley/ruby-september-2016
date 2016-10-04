class UsersController < ApplicationController
  def index
    #
  end

  def show
    @user = User.find(session[:id])
  end

  def create
    user= User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to "/users/show/#{@user.id}"
    else
      flash[:errors] = user.errors.full_messages
      puts flash[:errors].inspect
      redirect_to '/users/new'
    end
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
