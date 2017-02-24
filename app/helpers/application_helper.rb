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

  def show_cart_info
    if session[:cart_id].present?
      cart = Cart.find(session[:cart_id])
      total, count = cart.total, cart.product_count
    elsif (current_user.present? && current_user.cart.present?)
      total, count = current_user.cart.total, current_user.cart.product_count
    else
      total, count = 0, 0.00
    end
    "Basket: #{count} items $#{total}"
  end
end
