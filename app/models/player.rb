class Player < ActiveRecord::Base
  include ApplicationHelper
  include RpgHelper
  has_one :role
  has_many :battles
  def playable?
    !self.role.nil?
  end

  def hp_in_percentage
    in_percentage self.hp_max, self.hp_min
  end

  def mp_in_percentage
    in_percentage self.mp_max, self.mp_min
  end

  def exp_in_percentage
    in_percentage LEVEL_EXP[self.level - 1], self.exp
  end
end
