class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  before_action :set_categories

  def index
    @products = Product.search { order_by(:sell_counter, :desc) }.results
  end
end
