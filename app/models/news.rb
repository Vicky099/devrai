class News < ApplicationRecord
  has_one :picture, as: :imageable

  def photo_url
    if self.picture.present?
      return self.picture.photo_url
    else
      return 'default.png'
    end
  end
end
