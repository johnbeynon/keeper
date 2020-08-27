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

  def edit
    @tray = current_user.trays.find(params[:id])
  end

  def create
    @tray = Tray.new(tray_params)
    if @tray.save
      current_user.permissions.create(access:'readwrite', tray: @tray)
      redirect_to trays_path
    else
      raise @receipt.trays.inspect
    end
   end

  def tray_params
    params.require(:tray).permit(:name)
  end
end
