class Match < ActiveRecord::Base
  has_many :players
  has_many :battles

  def close
  end

end
