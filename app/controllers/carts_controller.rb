class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_categories
  before_action :load_cart, only: [:show, :remove_product]
  before_action :set_cart, only: [:add]

  def add
    if valid_product?
      cart_products = @cart.products
      unless cart_products.include?(@product)
        cart_product = CartProduct.create({ cart_id: @cart.id, product_id: @product.id, qty: 1, price: @product.price })
        @cart.total += @product.price
        @cart.product_count += 1
        @cart.save!
        render json: { message: 'Product successfully added into cart.', cart_count: @cart.product_count, total: @cart.total }, status: :created
      else
        render_ok_response('Product is already present in your cart.')
      end
    else
      render_ok_response('Product is no more exist.')
    end
  end

  def show
    @cart = if session[:cart_id].present?
       Cart.find(session[:cart_id])
    elsif current_user.present? && current_user.cart.present?
        current_user.cart
    end
  end

  def remove_product
    if params[:product_id].present? && @cart.present?
      cart_product = CartProduct.find_by_id(params[:product_id])
      if cart_product.present?
        @cart.total -= cart_product.price
        @cart.product_count -= cart_product.qty
        @cart.save!
        cart_product.destroy
      end
    end
    redirect_to cart_path
  end

  private
  def valid_product?
    params[:product_id].present? && (@product = Product.find_by_id(params[:product_id])).present?
  end

  def render_ok_response msg
    render json: { message: msg }, status: :ok
  end

  # Get/create cart object using session
  def set_cart
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = if current_user.present?
        current_user.cart || current_user.create_cart
      else
        Cart.create
      end
      session[:cart_id] = @cart.id
    end
  end

  def load_cart
    @cart = if session[:cart_id].present?
       Cart.find(session[:cart_id])
    elsif current_user.present? && current_user.cart.present?
        current_user.cart
    end
  end
end