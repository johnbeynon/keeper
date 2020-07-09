class Tray < ApplicationRecord
  has_many :permissions
  has_many :users, through: :permissions

  has_many :receipts
end
