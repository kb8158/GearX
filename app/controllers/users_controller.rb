class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(borrower_id: @user.id)
    @review = Review.new
    @reviews = Review.where(user_id: @user.id)
    @item = Item.find(params[:id])
  end

  def edit
  @user = User.find(params[:id])
  @review = Review.find(params[:id])
    if @user.lender != current_user
      flash[:notice] =  "Account owner can update information"
      redirect_to item_path(@item)
    end
  end

  def update
    @user = User.find(params[:id])
    @review = Review.find(params[:id])
    if @user.lender == current_user
      flash[:notice] =  "Item updated successfully"
      redirect_to item_path(@item)
    else
      flash.now[:notice] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.lender.destroy_all
    @user.destroy
    redirect_to users_path
  end
end
