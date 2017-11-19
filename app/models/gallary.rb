class Gallary < ApplicationRecord
  mount_uploader :photo, ImageUploader
  has_many :pictures, as: :imageable

  def save_picture(photo)
    self.pictures.build(photo: photo).save!
  end

  def self.save_picture(gallary, photo)
    gallary.pictures.build(photo: photo).save!
  end

  def photo_url
    if self.pictures.present?
      return self.pictures.first.photo_url
    else
      return 'default.png'
    end
  end
end
