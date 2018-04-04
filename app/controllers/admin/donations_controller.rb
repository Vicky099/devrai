class Admin::DonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_user
  before_action :donation, only:[:edit, :update, :show, :destroy]
  layout "admin"
  def index
    @donations = Donation.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:notice] = "Donation record added successfully."
      redirect_to admin_donations_path
    else
      flash[:alert] = "Please try again."
      render :new
    end
  end

  def edit

  end

  def update
    if @donation.update_attributes(donation_params)
      flash[:notice] = "Donation record updated successfully."
      redirect_to admin_donation_path(@donation.id)
    else
      flash[:alert] = "Please try again."
      render :edit
    end
  end

  def show
  end

  def destroy
    if @donation.destroy
      flash[:notice] = "Donation record deleted successfully."
      redirect_to admin_donations_path
    else
      flash[:alert] = "Please try again."
      redirect_to admin_donations_path
    end
  end

  private
  def donation_params
    params.require(:donation).permit(:name, :contact_no, :village, :type_of_donation, :date, :fund_month, :amount)
  end

  def donation
    @donation = Donation.find_by_id(params[:id])
  end
end
