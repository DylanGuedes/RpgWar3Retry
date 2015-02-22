class ShopController < ApplicationController
  def index
    @helms = Helm.all
    @weapons = Weapon.all
    @armors = Armor.all
  end
end
