class Api::V1::InventoriesController < ApplicationController
  before_action :set_inventories, only: [:index]

  def index
    render json: @inventories.map { |inventory| inventory.attributes.merge(shoe: inventory.shoe, store: inventory.store) }
  end

  def update
    @inventory = Inventory.find(params[:id])
    if @inventory.update(inventory_params)
      render json: @inventory, status: :ok
    else
      render json: { errors: ["Unable to update inventory"] }, status: :bad_request
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ["Inventory not found"] }, status: :not_found
  end

  private

  def set_inventories
    @inventories = Inventory.all
  end

  def inventory_params
    params.require(:inventory).permit(:stock)
  end
end
