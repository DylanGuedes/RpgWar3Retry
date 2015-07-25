class CosmeticItemsController < ApplicationController
  def create
    @cosmetic_item = CosmeticItem.new(item_params)
    if @cosmetic_item.save
      flash[:success] = "Created."
      redirect_to admin_panel_path
    else
      render '/admin_panel/index'
    end
  end

  private
  def item_params
    params.require(:cosmetic_item).permit(:name, :image_path, :description, :price, :damage,
     :defense, :cosmetic_type, :type)
  end
end
