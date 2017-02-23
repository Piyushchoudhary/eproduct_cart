class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @products = Product.search { order_by(:sell_counter, :desc) }.results
    @categories = Category.all
  end
end
