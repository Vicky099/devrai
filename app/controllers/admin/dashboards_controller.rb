class Admin::DashboardsController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin_user
  before_action :find_user, only: [:make_admin, :suspend_user]
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

  def all_users
    @users = User.order('id desc').paginate(:page => params[:page], :per_page => 10)
  end

  def make_admin
    @user.admin = params[:admin]
    @user.save!
    respond_to do |format|
      format.js
    end
  end

  def suspend_user
    @user.active = params[:active]
    @user.save!
    respond_to do |format|
      format.js
    end
  end

  private
  def find_user
    @user = User.find_by_id(params[:id])
  end
end
