class AdminPanelController < ApplicationController
  before_action :admin_filter
  def index
    @item = CosmeticItem.new
  end

end
