class Commitee < ApplicationRecord
  mount_uploader :photo, ImageUploader
  has_one :picture, as: :imageable
end
