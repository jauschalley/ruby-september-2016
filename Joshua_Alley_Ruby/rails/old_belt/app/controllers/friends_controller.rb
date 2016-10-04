class FriendsController < ApplicationController
  def create
  	Friendship.create(user_id:session[:id], friend_id:params[:id], status:"invite")
  	redirect_to '/users/all'
  end

  def destroy
  	Friendship.find(params[:id]).delete
  	redirect_to "/users/#{session[:id]}/show"
  end

  def update
  	Friendship.update(params[:id], status:"friend")
  	redirect_to "/users/#{session[:id]}/show"
  end
end
