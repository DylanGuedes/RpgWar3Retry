class CosmeticItem < ActiveRecord::Base
  validates :name, presence: true
  validates :damage, presence: true
  validates :defense, presence: true
  validates :cosmetic_type, presence: true

  def apply_status player
    generic_item = self.cosmetic_type.downcase
    unless player.send(generic_item).send("name") == self.name
      player.penalize
    end
    player.gold -= self.price
    player.extra_damage += self.damage
    player.extra_defense += self.defense
    player.send("#{generic_item}"+"=",parse_item)
    player.save
  end

  def parse_item
    new_item = self.cosmetic_type.constantize.new(name: self.name, price: self.price, description: self.description, damage: self.damage,
              defense: self.defense)
    return new_item
  end
end
