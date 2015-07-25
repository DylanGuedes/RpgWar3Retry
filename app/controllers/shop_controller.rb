class ShopController < ApplicationController
  def index
    @items = CosmeticItem.all
    @helms = @items.where(cosmetic_type: "Helm")
    @weapons = @items.where(cosmetic_type: "Weapon")
    @armors = @items.where(cosmetic_type: "Armor")
  end

  def buy_item
    desired_item = CosmeticItem.find(params[:id])
    if current_user.player.can_purchase? desired_item
      current_user.player.absorb desired_item
      flash[:success] = "Purchased!"
    else
      flash[:danger] = "You don't have enough gold."
    end
    redirect_to shop_path
  end
end
