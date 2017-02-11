class HomesController < ApplicationController

  def index
    @new_thing = Thing.new
    @new_item = Item.new
  end
end
