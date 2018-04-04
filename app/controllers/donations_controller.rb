class DonationsController < ApplicationController
  before_action :set_header_true
  def donation
    @donations = Donation.where(type_of_donation: Donation.type_of_donations['donation']).order("created_at DESC").uniq(&:contact_no).paginate(page: params[:page], per_page: 20)
  end

  def fund
    @funds = Donation.where(type_of_donation: Donation.type_of_donations['fund']).order("created_at DESC").uniq(&:contact_no).paginate(page: params[:page], per_page: 20)
  end

  def total_donate
    donation = Donation.find_by_id(params[:id])
    @type = donation.type_of_donation
    @donations = Donation.where("contact_no = ? AND type_of_donation = ?", donation.contact_no, Donation.type_of_donations[donation.type_of_donation]).order("created_at DESC").paginate(page: params[:page], per_page: 20)
  end

  private
  def set_header_true
    @sub_header = true
  end
end
