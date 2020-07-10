class Tray < ApplicationRecord
  has_many :permissions
  has_many :users, through: :permissions

  has_many :receipts

  scope :writable, -> { where("access = 'readwrite'") }


  # validates_uniqueness_of :name
end
