class Admin::GallarysController < ApplicationController
  include Sidekiq::Worker
  before_action :authenticate_user!, except:[:index, :show]
  before_action :verify_admin_user, except:[:index, :show]
  before_action :find_gallary, only: [:edit, :update, :show, :destroy]

  layout "admin"

  def index
    @gallary = Gallary.order('id desc').paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @gallary = Gallary.new
  end

  def create
    gallary = Gallary.new(gallary_params)
    gallary.build_picture(photo: params[:gallary][:photo])
    if gallary.save
      flash[:success] = "Memories created successfully."
      redirect_to admin_gallarys_path
    else
      flash[:danger] = "Something goes wrong. please fill the information and submit it again. Thanks."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @gallary.build_picture(photo: params[:gallary][:photo]) if params[:gallary][:photo].present?
    if @gallary.update_attributes(gallary_params)
      redirect_to admin_gallary_path(@gallary.id)
    else
    end
  end

  def destroy
    @gallary.destroy
    flash[:success] = "Image deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def gallary_params
    params.require(:gallary).permit(:name, :id, :photo_date)
  end

  def find_gallary
    @gallary = Gallary.find_by_id(params[:id])
  end

end
