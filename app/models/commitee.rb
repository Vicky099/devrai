class Commitee < ApplicationRecord
  #mount_uploader :photo, ImageUploader
  has_one :picture, as: :imageable, dependent: :destroy

  def photo_url
    if self.picture.present?
      return self.picture.photo_url
    else
      return 'default.png'
    end
  end
end
