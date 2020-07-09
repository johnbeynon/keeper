class User < ApplicationRecord
  
  has_many :permissions
  has_many :trays, through: :permissions
  has_many :receipts, through: :trays

  after_create :create_tray

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

  private
  def create_tray
    permissions.create(access:'readwrite', tray: Tray.create(name: 'Default'))
  end

end
