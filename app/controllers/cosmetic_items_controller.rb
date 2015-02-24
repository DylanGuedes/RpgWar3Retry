class CosmeticItemsController < ApplicationController
  def create
    item = CosmeticItem.new(item_params)
    if item.save
      flash[:success] = "Created."
    else
      render 'new'
    end
    redirect_to admin_panel_path
  end

    private
  def item_params
    params.require(:cosmetic_item).permit(:name, :description, :price, :damage, :defense, :cosmetic_type)
  end
end
