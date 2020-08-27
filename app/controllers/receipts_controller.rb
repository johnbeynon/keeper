class ReceiptsController < ApplicationController
  def index
    if params[:tray_id]
      @tray = current_user.trays.find(params[:tray_id])
      @receipts = @tray.receipts.kept
    elsif params[:merchant_id]
      @merchant = Merchant.find params[:merchant_id]
      @receipts = @merchant.receipts # needs to be done through trays to return readable receipts
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
    if receipt_params[:merchant] == 'new'
      @merchant = Merchant.create(name: receipt_params[:merchant_name])
      @receipt = Receipt.new(receipt_params.except(:merchant_name).merge(creator: current_user, merchant: @merchant))
    else
      @receipt = Receipt.new(receipt_params.except(:merchant, :merchant_name).merge(creator: current_user))
    end

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
    else
      raise @receipt.errors.inspect
    end

  end

  def destroy
    @receipt = current_user.receipts.find(params[:id])
    @receipt.discard

    redirect_to receipts_path
  end

  def receipt_params
    params.require(:receipt).permit(:tray_id, :merchant_id, :merchant, :merchant_name, :transaction_date, :amount, images: [])
  end
end
