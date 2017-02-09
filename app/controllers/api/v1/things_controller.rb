class Api::V1::ThingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @things = Thing.all
    render json: @things
  end
end
