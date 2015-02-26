class Player < ActiveRecord::Base
  include ApplicationHelper
  include RpgHelper
  has_one :role
  has_many :battles
  has_one :helm
  has_one :armor
  has_one :weapon
  belongs_to :user

  def playable?
    !self.role.nil?
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

  def can_purchase? item
    self.gold >= item.price ? true : false
  end
end
