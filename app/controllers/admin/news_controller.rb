class Admin::NewsController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :verify_admin_user, except:[:show]
  before_action :find_news, only: [:edit, :update, :show, :destroy]
  layout "admin"

  def index
    @news = News.order('created_at desc').paginate(:page => params[:page], :per_page => 20)
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

  def edit
  end

  def update
    @news.build_picture(photo: params[:news][:photo]) if params[:news][:photo].present?
    if @news.update_attributes(news_params)
      redirect_to admin_news_path(@news.id)
      flash[:notice] = "News updated successfully"
    else
      render :edit
      flash[:alert] = "Something went wrong. Please update one more time."
    end
  end

  def show
  end

  def destroy
    flash[:success] = "News deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def news_params
    params.require(:news).permit(:title, :description, :event_date)
  end

  def find_news
    @news = News.find_by_id(params[:id])
  end

end
