class ProductReviewsController < ApplicationController
  def new
    @product_review = ProductReview.new
    @product_review.product_id = params[:product_id]
  end

  def create
    @product_review = ProductReview.new(params[:product_review])
    @product_review.user_id = current_user.id
    if @product_review.save
      flash[:notice] = "product review successfully saved"
      redirect_to product_path(@product_review.product_id)
    else
      flash[:alert] = "failed to save store review"
      render 'new'
    end
  end
end