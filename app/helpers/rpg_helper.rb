module RpgHelper
  LEVEL_EXP = [300, 800, 1600]

  def can_play? user
    user && !user.players.empty? && user.players.last.playable? ? true : false;
  end

  def current_match
    Match.last
  end

end

