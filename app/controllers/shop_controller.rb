class ShopController < ApplicationController
  def index
    @items = CosmeticItem.all
    @helms = @items.where(type: "Helm")
    @weapons = @items.where(type: "Weapon")
    @armors = @items.where(type: "Armor")
  end

  def purchase_item
    desired_item = CosmeticItem.find(params[:id])
    if current_user.player.can_purchase? desired_item
      desired_item.apply_status current_user.player
      flash[:success] = "Purchased!"
      redirect_to shop_path
    else
      flash[:error] = "You don't have enough gold."
      redirect_to shop_path
    end
  end
end
