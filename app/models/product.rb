class Product < ApplicationRecord
  belongs_to :category

  before_validation { image.clear if @delete_image }

  before_validation { product_file.clear if @delete_product_file }

  has_attached_file :image, styles: { medium: "220x331>", thumb: "142x215>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :product_file
  validates_attachment_content_type :product_file, :content_type => ['application/pdf', 'application/msword', 'text/plain']

  validates :product_file, attachment_presence: true

  validates :title, presence: true, uniqueness: true

  validates :title, presence: true, uniqueness: true

  validates :price, presence: true

  validates :price, numericality: true

  searchable do
    text :title
    integer :price
    integer :category_id
    integer :sell_counter
  end

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end

  def delete_product_file
    @delete_product_file ||= false
  end

  def delete_product_file=(value)
    @delete_product_file  = !value.to_i.zero?
  end

end
