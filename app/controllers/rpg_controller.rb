class RpgController < ApplicationController
  def index
  end

  def help
  end

  def attack_player
    target = Player.find(params[:target_id])
    starter = current_user.last_player
    battle = Battle.new(target_id: target.id, starter_id: starter.id, match: current_match)
    battle.save
    battle.apply_status
    redirect_to rpg_battles_path
  end

  def targets
    @players = Player.where(match: current_match)
    @players = @players.where(atacable: true)
  end

  def jungle
    if current_user.last_player.dead?
      flash[:error] = "You are dead :("
    else
      current_user.last_player.to_jungle
      flash[:success] = "You are at jungle now."
      render 'index'
    end
  end

  def battles
    player = current_user.last_player
    @player_battles = Battle.where(:match => current_match, :starter_id => player.id)
    @player_battles += Battle.where(:match => current_match, :target_id => player.id)
    @player_battles.sort
  end

  def new_player
    if can_play? current_user
      flash[:notice] = "You already have a character"
    else
      player = current_user.players.new(user: current_user, role: Role.new, match: current_match)
      player.save
    end
    redirect_to root_path
  end
end
