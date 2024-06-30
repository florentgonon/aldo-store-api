class Api::V1::Stores::InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]
  before_action :set_inventories, only: [:index]

  def index
    @inventories = Inventory.where(store_id: params[:store_id])
    render json: @inventories
  end

  def show
    render json: @inventory
  end

  def update
    @inventory = Inventory.find(params[:id])
    if @inventory.update(inventory_params)
      render json: @inventory
    else
      render json: { errors: ["Unable to update inventory"] }
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:stock)
  end

  def set_inventories
    Inventory.all
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ["Inventory not found"] }
  end
end
