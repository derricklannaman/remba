class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    flash[:success] = "Item created!"
    redirect_to fashionboard_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_image, :message, :title)
  end

end