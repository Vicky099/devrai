module DonationHelper

  def total_donated_amount(contact_no, type)
    donations = Donation.where("type_of_donation = ? and contact_no = ?", Donation.type_of_donations[type], contact_no)
    return donations.pluck(:amount).sum
  end

end
