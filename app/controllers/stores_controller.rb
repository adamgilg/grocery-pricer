class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
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
      flash[:notice] = "Store successfully saved"
      redirect_to stores_path
    else
      flash[:alert] = "Problem saving store"
      redirect_to stores_path
    end
  end
end