class Admin::NewsController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    @news = News.order('created_at DESC')
  end

  def new
    @news = News.new
  end

  def create
    news = News.new(news_params)
    if news.save
      flash[:success] = "News created successfully."
      redirect_to admin_path
    else
      flash[:danger] = "Please try again. something went wrong."
      render :new
    end
  end

  def show
    @news = News.find(params[:id])
  end

  private
  def news_params
    params.require(:news).permit(:title, :description, :event_date)
  end

end
