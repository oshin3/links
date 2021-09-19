class ApplicationController < ActionController::Base

  include SessionsHelper  #追記
  include Pagy::Backend

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_links = user.links.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end