class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] =  "Item Added!"
      redirect_to items_path
    else
      flash.now[:notice] = @item.errors.full_messages
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :body)
  end
end
