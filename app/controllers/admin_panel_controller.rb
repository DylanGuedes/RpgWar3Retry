class AdminPanelController < ApplicationController
  before_action :admin_filter
  def index
    @cosmetic_item = CosmeticItem.new
  end
end
