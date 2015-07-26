class Battle < ActiveRecord::Base
  MAX_TURN = 4

  belongs_to :starter
  belongs_to :target
  belongs_to :player
  belongs_to :match

  def apply_status
    MAX_TURN.times do |a|
      starter = Player.find_by(id: self.starter_id)
      target = Player.find_by(id: self.target_id)

      target.hp_min -= (starter.aggregate_damage - target.aggregate_defense)
      unless target.dead?
        starter.hp_min -= (target.aggregate_damage - starter.aggregate_defense)
      else
        break
      end

      break if starter.dead?
    end
    starter.gold += 200
    target.gold += 500

    starter.save
    target.save
    self.save
  end
end
