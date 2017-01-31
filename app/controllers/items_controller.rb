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

  def edit
  @item = Item.find(params[:id])
    if @item.user != current_user
      flash[:notice] =  "Only item owner can update item information"
      redirect_to item_path(@item)
    end
  end

  def update
  @item = Item.find(params[:id])
  if @item.user == current_user
    flash[:notice] =  "Item updated successfully"
    redirect_to item_path(@item)
  else
    flash.now[:notice] = @item.errors.full_messages
    render :edit
  end
end

def destroy
  @item = Item.find(params[:id])
  if @item.user == current_user
    @item.destroy
    redirect_to items_path
  else
    flash[:notice] =  "Only item owner or Admin can delete item"
    redirect_to item_path(@item)
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :image, :body, :size, :zip_code)
  end
end
