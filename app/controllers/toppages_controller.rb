class ToppagesController < ApplicationController
  def index
    if logged_in?
      @link = current_user.links.build  # form_with 用
      @pagy, @links = pagy(current_user.links.order(id: :desc))
    end
  end
end