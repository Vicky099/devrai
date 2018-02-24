class Admin::CommiteesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_user
  before_action :find_commitee, only: [:edit, :update, :show, :destroy]
  layout "admin"

  def index
    @commitees = Commitee.order('id desc').paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @commitee = Commitee.new
  end

  def create
    commitee = Commitee.new(commitee_params)
    commitee.build_picture(photo: params['commitee']['photo'])
    if commitee.save
      flash[:success] = "Commitee Member added succssfully."
      redirect_to admin_path
    else
      flash[:danger] = "please try again. something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    @commitee.build_picture(photo: params[:commitee][:photo]) if params[:commitee][:photo].present?
    if @commitee.update_attributes(commitee_params)
      redirect_to admin_commitee_path(@commitee.id)
      flash[:notice] = "Profile updated successfully"
    else
      render :edit
      flash[:alert] = "Something went wrong. Please try again"
    end
  end

  def show
  end

  def destroy
    @commitee.destroy
    flash[:success] = "Member deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def commitee_params
    params.require(:commitee).permit(:name, :designation, :status, :bio)
  end

  def find_commitee
    @commitee = Commitee.find_by_id(params[:id])
  end

end
