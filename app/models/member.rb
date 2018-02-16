class Member < ApplicationRecord
  has_one :picture, as: :imageable, dependent: :destroy

  enum gender: {male: 0, female: 1}
  enum membership: {active: 0, inactive: 1}

  def photo_url
    if self.picture.present?
      return self.picture.photo_url
    else
      return 'http://res.cloudinary.com/ddbkhb3vl/image/asset/v1517130970/default-f923b61d87de05d96ee32141d21c6e68.png'
    end
  end
end
