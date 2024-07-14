class Api::V1::Stores::InventoriesController < ApplicationController
  def index
    inventories = Inventory.where(store_id: params[:store_id])
    render json: inventories.map { |inventory| inventory.attributes.merge(shoe: inventory.shoe, store: inventory.store) }, status: :ok
  end
end
