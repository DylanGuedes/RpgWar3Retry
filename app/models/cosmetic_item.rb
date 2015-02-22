class CosmeticItem < ActiveRecord::Base
  def apply_status player
    player.gold -= self.price
    player.damage += self.damage
    player.defense += self.defense
    item = parse_item
    case self.type
    when "Helm" then
      player.helm = item
    when "Armor" then
      player.armor = item
    when "Weapon" then
      player.weapon = item
    end
  end

  def parse_item
    new_item = self.type.constantize.new(name: cosmetic_item.name, price: cosmetic_item.price, description: cosmetic_item.description, damage: cosmetic_item.damage,
              defense: cosmetic_item.defense)
    return new_item
  end
end
