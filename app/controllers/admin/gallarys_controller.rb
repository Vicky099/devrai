class Admin::GallarysController < ApplicationController
  include Sidekiq::Worker

  layout "admin"

  def index
    @gallary = Gallary.all
  end

  def new
    @gallary = Gallary.new
  end

  def create
    gallary = Gallary.new(gallary_params)
    binding.pry
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

  def destroy
    image = Gallary.find(params[:id])
    image.destroy
    flash[:success] = "Image deleted succssfully"
    redirect_to delete_data_admin_dashboards_path
  end

  private
  def gallary_params
    params.require(:gallary).permit(:name, :id, :photo_date)
  end

end
