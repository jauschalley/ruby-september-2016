class UsersController < ApplicationController
  def index
    # 
  end

  def show
    @user = User.find(session[:id])
    @friends = Friendship.all
  end

  def create
    user= User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to "/users/#{session[:id]}/show"
    else
      flash[:errors] = user.errors.full_messages
      puts flash[:errors].inspect
      redirect_to '/users'
    end
  end

  def view
    @user = User.find(params[:id])
    render 'view'
  end

  def all
    @users = User.all
    @friends = Friendship.all
    render 'all'
  end

  def update
  end

  def destroy
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
