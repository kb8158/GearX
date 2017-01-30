class Api::V1::ElementsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @elements = Element.all
    render json: @elements
  end
end
