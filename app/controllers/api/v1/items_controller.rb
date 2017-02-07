class Api::V1::ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create, :update, :selected]

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
end
