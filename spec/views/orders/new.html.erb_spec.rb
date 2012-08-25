require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_title", :name => "order[title]"
      assert_select "textarea#order_description", :name => "order[description]"
    end
  end
end
