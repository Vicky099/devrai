class Admin::NewsController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :verify_admin_user, except:[:show]
  layout "admin"

  def index
    @news = News.order('created_at DESC')
  end

  def new
    @news = News.new
  end

  def create
    news = News.new(news_params)
    news.build_picture(photo: params['news']['photo'])
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

  def destroy
    news = News.find(params[:id])
    news.destroy
    flash[:success] = "News deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def news_params
    params.require(:news).permit(:title, :description, :event_date)
  end

end
