module ApplicationHelper
  def title_format str
    str.camelize
  end

  def truncate_str str, length=50
    truncate(str.strip, length: length)
  end
end
