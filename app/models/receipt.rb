class Receipt < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :tray
  has_many_attached :images
end
