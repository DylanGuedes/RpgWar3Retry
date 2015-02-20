module RpgHelper
  def can_play? user
    user.player && user.player.playable? ? true : false;
  end
end

