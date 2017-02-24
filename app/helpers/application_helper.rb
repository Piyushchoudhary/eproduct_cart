module ApplicationHelper
  def title_format str
    str.camelize
  end

  def truncate_str str, length=50
    truncate(str.strip, length: length)
  end

  def is_load_needed?(products)
    products.size > 12
  end

  def get_cart_total_count cart
    cart_products = cart.cart_products
    count = cart_products.count
    total = cart_products.inject(0){ |sum, e| sum + e.price }
    [total, count]
  end

  def show_cart_info
    if session[:cart_id].present?
      cart = Cart.find(session[:cart_id])
      total, count = get_cart_total_count(cart)
    elsif (current_user.present? && current_user.cart.present?)
      total, count = get_cart_total_count(current_user.cart)
    else
      total, count = 0, 0.00
    end
    "Basket: #{count} items $#{total}"
  end
end
