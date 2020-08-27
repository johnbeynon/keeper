class Merchant < ApplicationRecord
  has_many :receipts
  validates_uniqueness_of :name
end
