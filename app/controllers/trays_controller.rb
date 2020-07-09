class TraysController < ApplicationController
  def index
    @permissions = current_user.permissions
  end

  def show
    @receipts = current_user.trays.find(params[:id]).receipts
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
