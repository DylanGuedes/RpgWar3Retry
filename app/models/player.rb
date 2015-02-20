class Player < ActiveRecord::Base
  belongs_to :user
  has_one :role

  def playable?
    !self.role.nil?
  end
end
