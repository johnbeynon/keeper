class Receipt < ApplicationRecord
  belongs_to :tray
  has_many_attached :images
end
