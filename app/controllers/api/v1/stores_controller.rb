class Api::V1::StoresController < ApplicationController
  before_action :set_stores, only: [:index]

  def index
    render json: @stores
  end

  private

  def set_stores
    @stores = Store.all
  end
end
