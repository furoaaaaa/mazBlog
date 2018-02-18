class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]


def create
  favorite = current_user.favorites.create(blog_id: params[:blog_id])
  redirect_to blogs_path, notice: "いいね！しました"
end


def destroy
  favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
  redirect_to blog_path, notice: "いいね！を取り消ししました"
end

private

def logged_in_user
  unless  current_user
    flash[:referer] = 'ログインしてください'
    render new_session_path
  end
end


end

end
