class Api::V1::Stores::InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show]

  def index
    @inventories = Inventory.where(store_id: params[:store_id])
    render json: @inventories
  end

  def show
    render json: @inventory
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ["Inventory not found"] }
  end
end
