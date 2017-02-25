class SendProductDocMailer < ApplicationMailer
  default from: 'eproduct2017@gmail.com'

  def send_product_email(user, order, order_product, product)
    @user = user
    @product = product
    @order = order
    @order_product = order_product
    product_path = @product.product_file.path
    attachments['filename.jpg'] = File.read(product_path) if File.file?(product_path)
    mail(to: @user.email, subject: "Order #{@order.id}: Your e-product from E-product Cart!")
  end
end
