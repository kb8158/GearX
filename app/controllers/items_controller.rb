class ItemsController < ApplicationController

  def index
    # instead of all items, try showing only the ones where borrower_id is nil
    @items = Item.available
    @new_item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @new_item = Item.new
  end

  def new
    @item = Item.new
    @new_item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.lender = current_user
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
    if @item.lender != current_user
      flash[:notice] =  "Only item owner can update item information"
      redirect_to item_path(@item)
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.lender == current_user
      flash[:notice] =  "Item updated successfully"
      redirect_to item_path(@item)
    else
      flash.now[:notice] = @item.errors.full_messages
      render :edit
    end
  end

  def selected
    @item = Item.find(params[:id])
    if @item.borrower == nil
      @item.borrower = current_user
      @item.save
      SelectedMailer.selected(@item).deliver_now
      flash[:notice] =  "Item selected successfully!"
      redirect_to user_path(current_user)
    elsif @item.borrower == current_user
      @item.borrower = nil
      @item.save
      flash[:notice] =  "Item De-selected successfully"
      redirect_to items_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.lender == current_user
      @item.destroy
      redirect_to items_path
    else
      flash[:notice] =  "Only item owner"
      redirect_to item_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :body, :size, :zip_code, :lender_id, :borrower_id)
  end
end
