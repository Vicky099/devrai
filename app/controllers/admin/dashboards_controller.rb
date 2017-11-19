class Admin::DashboardsController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin_user
  layout "admin"

  def index
    @commitees = Commitee.includes(:picture).last(5)
    @news = News.includes(:picture).last(5)
    @gallarys = Gallary.includes(:pictures).last(5)
  end

  def delete_data
    @commitees = Commitee.includes(:picture)
    @news = News.includes(:picture)
    @gallarys = Gallary.includes(:pictures)
  end
end
