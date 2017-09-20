class News < ApplicationRecord
  has_one :picture, as: :imageable
end
