class Product < ApplicationRecord
  belongs_to :category

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

end
