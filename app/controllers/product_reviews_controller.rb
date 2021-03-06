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
    else
      flash[:alert] = "failed to save store review"
    end
    if request.xhr?
      render '/shared/_reviews',
        locals: { review_subject: @product_review.product },
        layout: false
    else
      redirect_to :back
    end
  end
end