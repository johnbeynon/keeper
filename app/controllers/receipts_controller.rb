class ReceiptsController < ApplicationController
  def index
    @receipts = current_user.receipts.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipts_path
    else
      raise @receipt.errors.inspect
    end
   end

  def receipt_params
    params.require(:receipt).permit(:tray_id, :transaction_date, :amount, images: [])
  end
end
