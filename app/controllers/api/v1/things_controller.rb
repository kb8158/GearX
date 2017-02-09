class Api::V1::ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token
end
