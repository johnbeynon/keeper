class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :tray
end
