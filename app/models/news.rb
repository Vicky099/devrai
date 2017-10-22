class News < ApplicationRecord
  has_one :picture, as: :imageable

  def photo_url
    self.picture.photo_url
  end
end
