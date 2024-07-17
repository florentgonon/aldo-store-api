class Api::V1::TransfersController < ApplicationController
  def create
    source_store = Store.find(params[:source_store_id])
    destination_store = Store.find(params[:destination_store_id])
    shoe = Shoe.find(params[:shoe_model_id])
    quantity = params[:quantity].to_i

    if source_store.transfer_stock_to(destination_store, shoe, quantity)
      render json: { message: "Stock transferred successfully" }, status: :ok
    else
      render json: { errors: source_store.errors }, status: :unprocessable_entity
    end
  end
end
