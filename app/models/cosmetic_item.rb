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
    player.save
  end

  def parse_item
    new_item = self.cosmetic_type.constantize.new(name: self.name, price: self.price, description: self.description, damage: self.damage,
              defense: self.defense)
    return new_item
  end
end
