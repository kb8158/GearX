class Api::V1::BitsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @bits = Bit.all
    render json: @items
  end
end
