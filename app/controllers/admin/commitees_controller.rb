class Admin::CommiteesController < ApplicationController
  before_action :authenticate_user!
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

  private
  def commitee_params
    params.require(:commitee).permit(:name, :designation, :status)
  end

end
