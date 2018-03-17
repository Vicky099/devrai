class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  validates :full_name, presence: true
  #validates :date_of_birth, presence: true
  validates :contact_no, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.first_name+ " " +auth.info.last_name
    end
  end

end
