require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @admin_product = assign(:admin_product, Admin::Product.create!(
      :title => "Title",
      :description => "MyText",
      :product_type_id => 2,
      :no_pages => 3,
      :publisher => "Publisher",
      :isbn => "Isbn",
      :price => "9.99",
      :writer_name => "Writer Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Writer Name/)
  end
end
