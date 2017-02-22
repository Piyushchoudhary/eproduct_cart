require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:admin_products, [
      Admin::Product.create!(
        :title => "Title",
        :description => "MyText",
        :product_type_id => 2,
        :no_pages => 3,
        :publisher => "Publisher",
        :isbn => "Isbn",
        :price => "9.99",
        :writer_name => "Writer Name"
      ),
      Admin::Product.create!(
        :title => "Title",
        :description => "MyText",
        :product_type_id => 2,
        :no_pages => 3,
        :publisher => "Publisher",
        :isbn => "Isbn",
        :price => "9.99",
        :writer_name => "Writer Name"
      )
    ])
  end

  it "renders a list of admin/products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Writer Name".to_s, :count => 2
  end
end
