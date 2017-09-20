class Commitee < ApplicationRecord
  has_one :picture, as: :imageable
end
