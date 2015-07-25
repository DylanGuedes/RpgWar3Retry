class BattleController < ApplicationController
  def attack_player
    battle = Battle.new(starter_id: params[:starter_id], target_id: params[:target_id])
  end
end
