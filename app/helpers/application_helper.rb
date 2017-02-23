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
end
