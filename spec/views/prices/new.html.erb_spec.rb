require 'spec_helper'

describe "prices/new" do
  before(:each) do
    assign(:price, stub_model(Price,
      :product_id => 1,
      :store_id => 1,
      :price => 1
    ).as_new_record)
  end

  it "renders new price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prices_path, :method => "post" do
      assert_select "input#price_product_id", :name => "price[product_id]"
      assert_select "input#price_store_id", :name => "price[store_id]"
      assert_select "input#price_price", :name => "price[price]"
    end
  end
end
