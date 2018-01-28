class HomesController < ApplicationController
  layout "application"
  def index
    @members = Commitee.last(4)
    @news = News.last(2)
  end

  def community
    @sub_header = true
  end

  def news
    @sub_header = true
    @news = News.includes(:picture)
  end
end
