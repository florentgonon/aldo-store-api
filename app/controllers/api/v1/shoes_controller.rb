class Api::V1::ShoesController < ApplicationController
  before_action :set_shoes, only: [:index]

  def index
    render json: @shoes
  end

  private

  def set_shoes
    @shoes = Shoe.all
  end
end
