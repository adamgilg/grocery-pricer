class StoreReviewsController < ApplicationController
  def new
    @store_review = StoreReview.new
    @store_review.store_id = params[:store_id]
  end

  def create
    @store_review = StoreReview.new(params[:store_review])
    if @store_review.save
      flash[:success] = "store review successfully saved"
      redirect_to store_path(@store_review.store_id)
    else
      flash[:error] = "failed to save store review"
      render 'new'
    end
  end
end