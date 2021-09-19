class LinksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @pagy, @links = pagy(current_user.links.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @link.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def link_params
    params.require(:link).permit(:content)
  end

  def correct_user
    @link = current_user.links.find_by(id: params[:id])
    unless @link
      redirect_to root_url
    end
  end
end