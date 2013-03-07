class StoreReviewsController < ApplicationController
  def new
    @store_review = StoreReview.new
    @store_review.store_id = params[:store_id]
  end

  def create
    @store_review = StoreReview.new(params[:store_review])
    @store_review.user_id = current_user.id
    if @store_review.save
      flash[:notice] = "store review successfully saved"
    else
      flash[:alert] = "failed to save store review"
    end
    if request.xhr?
      render '/shared/_reviews',
        locals: { review_subject: @store_review.store },
        layout: false
    else
      redirect_to :back
    end
  end
end