class User < ApplicationRecord
  
  has_many :permissions
  has_many :trays, through: :permissions
  has_many :receipts, through: :trays

  after_create :create_tray

  # PERMITTED_SENDERS = ENV['PERMITTED_SENDERS'].split(',')
  # PERMITTED_USERS = ENV['PERMITTED_USERS'].split(',')

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.password = SecureRandom.hex
    end
  end

  def default_tray
    trays.where(default: true).first
  end

  private
  def create_tray
    permissions.create(access:'readwrite', tray: Tray.create(name: 'Default', default: true))
  end

end
