class BlogsController < ApplicationController

  def index
    @blog = Blog.new
  end


  #新規作成処理
  def create

    @blog = Blog.new(blog_params)

    if @blog.save
      #成功の場合
      #一覧画面へリダイレクト
      redirect_to blogs_path, notice:'新規のつぶやきが完了しました'
    else
      #失敗の場合
      #トップ画面を再描画
      render confirm_blogs_path
    end
  end

end
