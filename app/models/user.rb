class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :full_name, presence: true
  #validates :date_of_birth, presence: true
  validates :contact_no, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
