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
    if @item.borrower == nil
      @item.borrower = @user
      @item.save
      SelectedMailer.selected(@item).deliver_later
      flash[:notice] =  "Item selected successfully!"
      redirect_to user_path(@user)
    elsif @item.borrower == @user
      @item.borrower = nil
      @item.save
      flash[:notice] =  "Item De-selected successfully"
      redirect_to items_path
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
