module RpgHelper
  LEVEL_EXP = [300, 800, 1600]

  def can_play? user
    user && user.player && user.player.playable? ? true : false;
  end

end

