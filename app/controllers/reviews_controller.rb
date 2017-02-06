class ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.item = @item
    @review.save
    redirect_to user_path(@item.borrower)
  end

  def edit
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])

  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@item.borrower)
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
