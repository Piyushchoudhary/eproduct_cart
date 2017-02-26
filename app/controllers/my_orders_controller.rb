class MyOrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    if params[:id].present?
      @order = Order.find(params[:id])
    end
  end
end
