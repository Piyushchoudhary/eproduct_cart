require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:admin_product, Admin::Product.new(
      :title => "MyString",
      :description => "MyText",
      :product_type_id => 1,
      :no_pages => 1,
      :publisher => "MyString",
      :isbn => "MyString",
      :price => "9.99",
      :writer_name => "MyString"
    ))
  end

  it "renders new admin_product form" do
    render

    assert_select "form[action=?][method=?]", admin_products_path, "post" do

      assert_select "input#admin_product_title[name=?]", "admin_product[title]"

      assert_select "textarea#admin_product_description[name=?]", "admin_product[description]"

      assert_select "input#admin_product_product_type_id[name=?]", "admin_product[product_type_id]"

      assert_select "input#admin_product_no_pages[name=?]", "admin_product[no_pages]"

      assert_select "input#admin_product_publisher[name=?]", "admin_product[publisher]"

      assert_select "input#admin_product_isbn[name=?]", "admin_product[isbn]"

      assert_select "input#admin_product_price[name=?]", "admin_product[price]"

      assert_select "input#admin_product_writer_name[name=?]", "admin_product[writer_name]"
    end
  end
end
