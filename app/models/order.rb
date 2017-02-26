class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products

  def get_status
    order_products.any? { |product| product.status == 'pending' } ? 'Pending' : 'Completed'
  end
end
