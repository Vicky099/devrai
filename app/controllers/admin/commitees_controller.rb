class Admin::CommiteesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_user
  layout "admin"

  def index
  end

  def new
    @commitee = Commitee.new
  end

  def create
    commitee = Commitee.new(commitee_params)
    if commitee.save
      flash[:success] = "Commitee Member added succssfully."
      redirect_to admin_path
    else
      flash[:danger] = "please try again. something went wrong."
      render :new
    end
  end

  def show
    @commitee = Commitee.find(params[:id])
  end

  def destroy
    member = Commitee.find(params[:id])
    member.destroy
    flash[:success] = "Member deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def commitee_params
    params.require(:commitee).permit(:name, :designation, :status, :bio)
  end

end
