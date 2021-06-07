class PurchasesController < ApplicationController
  def index
    @purchases = Purchases.all
  end

  def new
  end

  def create
  end

  def show
    @purchase = Purchase.find(params[:id])
  end
end
