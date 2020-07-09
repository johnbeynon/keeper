class TraysController < ApplicationController
  def index
    @permissions = current_user.permissions
  end

  def show
    @tray = current_user.trays.find(params[:id])
  end

  def new
    @tray = Tray.new
  end

  def create
    @tray = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipts_path
    else
      raise @receipt.errors.inspect
    end
   end

  def tray_params
    params.require(:tray).permit(:name)
  end
end
