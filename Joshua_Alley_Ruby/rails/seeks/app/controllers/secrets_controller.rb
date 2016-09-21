class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def new
  end

  def index
  	render '/secrets/show'
  end

  def create
  	Secret.create(user_id:session[:id], content: params[:secret][:content])
  	redirect_to "/users/#{session[:id]}"
  end

  def show
  	@secrets = Secret.all
  end

  def destroy
  	secret = Secret.find(params[:id])
  	secret.destroy if session[:id] == secret.user_id
  	redirect_to "/users/#{session[:id]}"
  end
end
