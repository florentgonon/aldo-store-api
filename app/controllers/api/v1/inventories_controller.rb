class Api::V1::InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
    render json: @inventories
  end
end
