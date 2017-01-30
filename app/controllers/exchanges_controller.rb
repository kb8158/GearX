class ExchangesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @exchange = Exchange.new
  end

  def create
    @item = Item.find(params[:item_id])
    @exchange = Exchange.new(exchange_params)
    @exchange.item = @item
    @exchange.user = current_user
    if @exchange.save

      flash[:notice] =  "Exchange added successfully"
      redirect_to item_path(@item)
    else
      flash[:notice] = @exchange.errors.full_messages
      redirect_to item_path(@item)
    end
  end

  def update
    @item = Item.find(params[:item_id])
    @exchange = Exchange.find(params[:id])
    if @exchange.user == current_user && @exchange.update(exchange_params)
      flash[:notice] =  "Exchange updated successfully"
      redirect_to item_path(@item)
    else
      flash.now[:notice] = @exchange.errors.full_messages
      render :edit
    end
  end

  def exchange_params
    params.require(:exchange).permit(:user_id, :item_id, :selected)
  end

end
