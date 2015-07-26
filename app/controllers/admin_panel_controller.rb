class AdminPanelController < ApplicationController
  before_action :admin_filter

  def index
    @cosmetic_item = CosmeticItem.new
  end

  def new_match
    if current_match
      current_match.close
    end

    new_match = Match.new
    new_match.save
    redirect_to admin_panel_path
  end

end
