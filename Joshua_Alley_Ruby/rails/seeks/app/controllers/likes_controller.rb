class LikesController < ApplicationController
  def create
    Like.create(secret_id:params[:id], user_id:session[:id])
    redirect_to "/users/#{session[:id]}"
  end

  def show
  end

  def destroy
    like = Like.find_by user_id:session[:id]
    puts like[:secret_id]
    puts "pppppppppppppppppppppppppp"
    puts params[:id]
    if like[:secret_id].to_i == params[:id].to_i
      Like.destroy(like[:id])
      redirect_to "/users/#{session[:id]}"
    else
      redirect_to "/users/#{session[:id]}"
    end
  end

  def new
  end

  def index
  end
end
