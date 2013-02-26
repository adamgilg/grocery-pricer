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
      flash[:success] = "Store successfully saved"
      redirect_to root_path
    else
      flash[:error] = "Problem saving store"
      render 'new'
    end
  end
end