class DonationsController < ApplicationController
  before_action :set_header_true
  def donation
    @donations = Donation.where(type: Donation.type_of_donations['donation']).order("created_at DESC").paginate(page: params[:page], per_page: 20)
  end

  def fund
    @funds = Donation.where(type: Donation.type_of_donations['fund']).order("created_at DESC").paginate(page: params[:page], per_page: 20)
  end

  private
  def set_header_true
    @sub_header = true
  end
end
