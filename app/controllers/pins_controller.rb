class PinsController < ApplicationController
  before_action :authenticate_user!

  def create
    @pin = Pin.new(pin_params)
    @pin.user = current_user
    @pin.save!
    flash[:success] = "Pinned!"
    redirect_to fashionboard_path
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    flash[:success] = "Unpinned!"
    redirect_to fashionboard_path
  end

  private

  def pin_params
    params.require(:pin).permit(:item_id, :item_image)
  end
end