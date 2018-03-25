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
    @news = News.includes(:picture)
  end

  private
  def set_header_true
    @sub_header = true
  end
end
