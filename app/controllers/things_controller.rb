class ThingsController < ApplicationController

  def index
    @things = Thing.needed
  end

  def show
    @thing = Thing.find(params[:id])
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    @thing.searcher = current_user
    if @thing.save
      flash[:notice] = "Item Added to WishList"
      redirect_to things_path
    else
      flash.now[:notice] = @thing.errors.full_messages
      render :new
    end
  end

  def edit
    @thing = Thing.find(params[:id])
    if @thing.searcher != current_user
      flash[:notice] = "Only owner or query can update item information"
    end
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.lender == current_user
      flash[:notice] = "WishList item updated successfully"
    else
      flash.now[:notice] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    if @thing.searcher == current_user
      @item.destroy
      redirect_to things_path
    else
      flash[:notice] = "Only item owner can delete query"
      redirect_to things_path
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:name, :body, :days, :date, :zip_code, :searcher_id, :finder_id)
  end
end
