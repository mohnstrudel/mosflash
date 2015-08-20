require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :fname => "Fname",
        :lname => "Lname",
        :company => "Company",
        :street => "Street",
        :city => "City",
        :zip => "Zip",
        :phone => "Phone",
        :mail => "Mail",
        :pay_type => "Pay Type",
        :delivery_type => "Delivery Type"
      ),
      Order.create!(
        :fname => "Fname",
        :lname => "Lname",
        :company => "Company",
        :street => "Street",
        :city => "City",
        :zip => "Zip",
        :phone => "Phone",
        :mail => "Mail",
        :pay_type => "Pay Type",
        :delivery_type => "Delivery Type"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    assert_select "tr>td", :text => "Pay Type".to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Type".to_s, :count => 2
  end
end
