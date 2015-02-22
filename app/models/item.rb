class Item < ActiveRecord::Base
  belongs_to :player

  def apply_status player, cosmetic_item
    player.gold -= cosmetic_item.price
    player.damage += cosmetic_item.damage
    player.defense += cosmetic_item.defense
    item = parse_item cosmetic_item
    case cosmetic_item.type
    when "Helm" then
      player.helm = item
    when "Armor" then
      player.armor = item
    when "Weapon" then
      player.weapon = item
    end
    player.save
  end

  def parse_item cosmetic_item
    new_item = cosmetic_item.type.constantize.new(name: cosmetic_item.name, price: cosmetic_item.price, description: cosmetic_item.description, damage: cosmetic_item.damage,
              defense: cosmetic_item.defense)
    return new_item
  end
 
end
