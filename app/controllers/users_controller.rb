class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(borrower_id: @user.id)
  end

end
