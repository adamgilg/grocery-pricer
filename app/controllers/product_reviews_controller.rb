class ProductReviewsController < ApplicationController
  def new
    @product_review = ProductReview.new
    @product_review.product_id = params[:product_id]
  end

  def create
    @product_review = ProductReview.new(params[:product_review])
    if @product_review.save
      flash[:success] = "product review successfully saved"
      redirect_to product_path(@product_review.product_id)
    else
      flash[:error] = "failed to save store review"
      render 'new'
    end
  end
end