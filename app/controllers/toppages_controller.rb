class ToppagesController < ApplicationController
  def index
    if logged_in?
      @link = current_user.links.build
      @pagy, @links = pagy(current_user.feed_links.order(id: :desc))
    end
  end
end