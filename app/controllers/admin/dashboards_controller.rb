class Admin::DashboardsController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin_user
  layout "admin"

  def index
    @commitees = Commitee.includes(:picture).last(5)
    @news = News.includes(:picture).last(5)
    @gallarys = Gallary.includes(:picture).last(5)
  end

  def delete_data
    @commitees = Commitee.includes(:picture).paginate(:page => params[:page], :per_page => 10)
    @news = News.includes(:picture).paginate(:page => params[:page], :per_page => 10)
    @gallarys = Gallary.includes(:picture).paginate(:page => params[:page], :per_page => 10)
  end
end
