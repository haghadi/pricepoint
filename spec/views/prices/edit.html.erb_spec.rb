require 'spec_helper'

describe "prices/edit" do
  before(:each) do
    @price = assign(:price, stub_model(Price,
      :product_id => 1,
      :store_id => 1,
      :price => 1
    ))
  end

  it "renders the edit price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prices_path(@price), :method => "post" do
      assert_select "input#price_product_id", :name => "price[product_id]"
      assert_select "input#price_store_id", :name => "price[store_id]"
      assert_select "input#price_price", :name => "price[price]"
    end
  end
end
