class Donation < ApplicationRecord
  enum type_of_donation: {donation: '0', fund: '1'}
  enum month: {January: '0', February: '1', March: '2', April: '3', May: '4', June: '5', July: '6', August: '7', September: '8', October: '9', November: '10', December: '11'}
  validates :name, presence: true
  validates :village, presence: true
  validates :fund_month, presence: true
  validates :amount, presence: true
  validates :type_of_donation, presence: true
  validates :contact_no, presence: true
end
