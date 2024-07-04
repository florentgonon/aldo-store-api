class Api::V1::Stores::InventoriesController < ApplicationController
  before_action :set_inventories, only: [:index]
  before_action :set_inventory, only: [:show]

  def index
    render json: @inventories.map { |inventory| inventory.attributes.except("shoe_id", "store_id").merge(shoe_name: inventory.shoe.name, store_name: inventory.store.name) }
  end

  def show
    render json: @inventory
  end

  private

  def set_inventories
    @inventories = Inventory.where(store_id: params[:store_id])
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ["Inventory not found"] }
  end
end
