class StoresController < ApplicationController
  include StoresHelper
  def show
    @store = Store.find(params[:id])
    @average_rating = @store.store_reviews.average('rating').to_f
  end

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      flash[:success] = "Store successfully saved"
      redirect_to root_path
    else
      flash[:error] = "Problem saving store"
      render 'new'
    end
  end

  # def average_rating(store)
  #   rated_store = Store.find(store.id)
  #   rated_store.store_reviews.average('rating').to_f
  # end
end