class ReceiptsController < ApplicationController
  def index
    if params[:tray_id]
      @tray = current_user.trays.find(params[:tray_id])
      @receipts = @tray.receipts.kept
    else
      @receipts = current_user.receipts.kept
    end
  end

  def new
    @receipt = Receipt.new
  end

  def edit
    @receipt = current_user.receipts.find(params[:id])
  end

  def create
    @receipt = Receipt.new(receipt_params.merge(creator: current_user))
    if @receipt.save
      redirect_to receipts_path
    else
      raise @receipt.errors.inspect
    end
  end

  def update
    @receipt = current_user.receipts.find(params[:id])
    if @receipt.update receipt_params
      redirect_to receipt_path(@receipt.id)
   end
  end

  def destroy
    @receipt = current_user.receipts.find(params[:id])
    @receipt.discard

    redirect_to receipts_path
  end

  def receipt_params
    params.require(:receipt).permit(:tray_id, :transaction_date, :amount, images: [])
  end
end
