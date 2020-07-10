class ReceiptsController < ApplicationController
  def index
    if params[:tray_id]
      @receipts = current_user.trays.find(params[:tray_id]).receipts
    else
      @receipts = current_user.receipts.all
    end
  end

  def new
    @receipt = Receipt.new
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def create
    @receipt = Receipt.new(receipt_params.merge(creator: current_user))
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
