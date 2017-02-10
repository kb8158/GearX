class Api::V1::ThingsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create, :update, :chosen, :destroy]

  def index
    @things = Thing.all
    @user = current_user
    render json: {things: @things, user: @user }
  end

  def chosen
    @thing = Thing.find(params[:id])
    @user = current_user
    if @thing.finder == nil
      @thing.finder = @user
      @thing.save
      flash[:notice] =  "Thing selected successfully!"
      redirect_to user_path(current_user)
    elsif @thing.finder == @user
      @thing.finder = nil
      @thing.save
      flash[:notice] =  "Thing De-selected successfully"
      redirect_to things_path
    end
  end

  def edit
  @thing = Thing.find(params[:id])
    if @thing.lender != current_user
      flash[:notice] =  "Only owner can update item information"
      redirect_to thing_path(@thing)
    end
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.lender == current_user
      flash[:notice] =  "Thing updated successfully"
      redirect_to thing_path(@thing)
    else
      flash.now[:notice] = @thing.errors.full_messages
      render :edit
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    @user = current_user
    if @thing.searcher == current_user
      @thing.destroy
      redirect_to things_path
    else
      flash[:notice] =  "Only item owner or Admin can delete item"
      redirect_to thing_path(@thing)
    end
  end

end