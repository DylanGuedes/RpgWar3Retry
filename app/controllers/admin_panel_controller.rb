class AdminPanelController < ApplicationController
  before_action :admin_filter
  def index
    @item = Item.new
  end

  def new_item
    item = Item.new(item_params)
    if item.save
      flash[:success] = "Created."
    else
      render 'new'
    end
    redirect_to admin_panel
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :damage, :defense, :type)
  end
end
