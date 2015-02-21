class RpgController < ApplicationController
  def index
  end

  def help
  end

  def targets
    @players = Player.where(atacable: true)
  end

  def new_player
    if can_play? current_user
      flash[:notice] = "You already have a character"
    else
      current_user.player = Player.new(user: current_user, role: Role.new)
      current_user.player.save
    end
    redirect_to root_path
  end
end
