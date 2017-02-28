class Api::V1::ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create, :update, :selected, :destroy]

  def index
    @items = Item.available
    @user = current_user
    render json: {items: @items, user: @user}
  end

  def selected
    @item = Item.find(params[:item_id])
    @user = current_user
    @item.borrower_id << @user.id
    @item.available = false
    @item.save
    SelectedMailer.selected(@item, @user).deliver_now
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

  def destroy
    @item = Item.find(params[:id])
    @user = current_user
    if @item.lender == current_user
      @item.destroy
      redirect_to items_path
    else
      flash[:notice] =  "Only item owner or Admin can delete item"
      redirect_to item_path(@item)
    end
  end

end
