class Admin::GallarysController < ApplicationController
  include Sidekiq::Worker
  before_action :authenticate_user!
  before_action :verify_admin_user, except:[:index, :show]

  layout "admin"

  def index
    @gallary = Gallary.all
  end

  def new
    @gallary = Gallary.new
  end

  def create
    gallary = Gallary.new(gallary_params)
    if gallary.save
      #gallary.pictures.build(photo: photo).save!
      Gallary.save_picture(gallary, params[:gallary][:photo])
      flash[:success] = "Memories created successfully."
      redirect_to admin_gallarys_path
    else
      flash[:danger] = "Something goes wrong. please fill the information and submit it again. Thanks."
      render :new
    end
  end

  def show
    @gallary = Gallary.find_by(id: params[:id])
  end

  def destroy
    image = Gallary.find(params[:id])
    image.destroy
    flash[:success] = "Image deleted successfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def gallary_params
    params.require(:gallary).permit(:name, :id, :photo_date)
  end

end
