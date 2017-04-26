class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build
      if session[:micropost].present?
        @micropost.content = session[:micropost]
      end
      @microposts = current_user.feed_microposts.order("created_at DESC").page(params[:page])
    end
  end
end
