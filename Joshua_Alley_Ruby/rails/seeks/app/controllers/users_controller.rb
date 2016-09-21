class UsersController < ApplicationController
  before_action :require_login, except: [:new_user, :create_user, :enter]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def index
  end

  def create_user
    user = User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def enter
    render 'log_in'
  end

  def new_user
    render 'create_user'
  end

  def show
    @user = User.find(id = session[:id])
    @secrets = @user.secrets.all
  end

  def edit
    @user = User.find(id = session[:id])
  end

  def update
    User.update(id = session[:id], user_params)
    session[:id] = user.id
    redirect_to "/users/#{user.id}"
  end

  def destroy
    User.destroy(session[:id])
    session[:id] = nil
    redirect_to '/sessions/new'

  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
