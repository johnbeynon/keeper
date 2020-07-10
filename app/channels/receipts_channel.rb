class ReceiptsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "receipts"
  end
end