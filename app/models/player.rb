class Player < ActiveRecord::Base
  include ApplicationHelper
  include RpgHelper
  has_one :role
  has_many :battles
  has_one :helm
  has_one :armor
  has_one :weapon
  has_many :items
  belongs_to :user
  belongs_to :match

  def playable?
    if !self.role.nil? && self.match == current_match
      true
    else
      false
    end
  end

  def hp_in_percentage
    in_percentage self.hp_max, self.hp_min
  end

  def mp_in_percentage
    in_percentage self.mp_max, self.mp_min
  end

  def aggregate_damage
    self.damage + self.extra_damage
  end

  def aggregate_defense
    self.defense + self.extra_defense
  end

  def exp_in_percentage
    in_percentage LEVEL_EXP[self.level - 1], self.exp
  end

  def penalize
    self.extra_damage = 0
    self.extra_defense = 0
    self.save
  end

  def absorb desired_item
    item_type = desired_item.cosmetic_type.downcase
    self.penalize if needs_penalization?(desired_item)
    self.gold -= desired_item.price
    self.extra_damage += desired_item.damage
    self.extra_defense += desired_item.defense
    self.save
  end

  def needs_penalization? desired_item
    item_type = desired_item.cosmetic_type.downcase
    if !have_slots?(desired_item) || (self.send(item_type).send('name') == desired_item.name)
      false
    else
      true
    end
  end

  def can_purchase? item
    enough_money?(item) ? true : false
  end

  def have_slots? item
    item_type = item.cosmetic_type.downcase
    self.send(item_type) ? true : false
  end

  def enough_money?(item)
    self.gold >= item.price ? true : false
  end

  def dead?
    self.hp_min < 0 ? true : false
  end

  def to_jungle
    self.state = "jungle"
    self.atacable = true
    self.save
  end

  def to_war
    self.state = "war"
    self.atacable = true
    self.save
  end
end
