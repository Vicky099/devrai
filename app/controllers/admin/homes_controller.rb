class Admin::HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_user

  def index
    @home_content = HomeContent.all
  end

  def new
    @home_content = HomeContent.new
  end

  def create
    @home_content = HomeContent.new(home_params)
    if @home_content.save
      flash[:notice] = "home content added successfully"
      redirect_to admin_home_path(@home_content.id)
    else
      flash[:alert] = "Something went wrong, please try again."
      render :new
    end
  end

  def show
    @home_content = HomeContent.find_by_id(params[:id])
  end

  def edit
    @home_content = HomeContent.find_by_id(params[:id])
  end

  def update
    @home_content = HomeContent.find_by_id(params[:id])
    if @home_content.update_attributes(home_params)
      flash[:notice] = "home content updated successfully"
      redirect_to admin_home_path(@home_content.id)
    else
      flash[:alert] = "Something went wrong, please try again"
      render :edit
    end
  end

  def destroy
    @home_content = HomeContent.find_by_id(params[:id])
    @home_content.destroy
    flash[:notice] = "Home content deleted successfully"
    redirect_to admin_homes_path
  end

  private
  def home_params
    params.require(:home_content).permit(:site_header, :site_menu, :content1_header, :content1_desc, :content2_header, :content2_sub_header, :content2_desc, :content3_header, :content3_desc, :content4_header, :content4_thought1_desc, :content4_thought1_name, :content4_thought1_position, :content4_thought2_desc, :content4_thought2_name, :content4_thought2_position, :content4_thought3_desc, :content4_thought3_name, :content4_thought3_position, :content5_header, :content6_header)
  end
end
