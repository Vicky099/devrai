class HomesController < ApplicationController
  layout "application"
  before_action :set_header_true, only: [:community, :news]
  def index
    @members = Commitee.last(4)
    @news = News.last(2)
    @sub_header = false
    @home = HomeContent.first
  end

  def community
  end

  def news
    @news = News.includes(:picture).order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end

  private
  def set_header_true
    @sub_header = true
  end
end
