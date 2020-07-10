class Receipt < ApplicationRecord
  include Discard::Model
  
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :tray
  has_many_attached :images
  after_create :broadcast

  def broadcast
    ActionCable.server.broadcast("receipts",
      content: ApplicationController.renderer.render(
        partial: 'receipts/receipt', locals: {
          receipt: self
        }))
  end
end
