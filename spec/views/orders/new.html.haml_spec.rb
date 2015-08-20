require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :fname => "MyString",
      :lname => "MyString",
      :company => "MyString",
      :street => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :phone => "MyString",
      :mail => "MyString",
      :pay_type => "MyString",
      :delivery_type => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_fname[name=?]", "order[fname]"

      assert_select "input#order_lname[name=?]", "order[lname]"

      assert_select "input#order_company[name=?]", "order[company]"

      assert_select "input#order_street[name=?]", "order[street]"

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_zip[name=?]", "order[zip]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_mail[name=?]", "order[mail]"

      assert_select "input#order_pay_type[name=?]", "order[pay_type]"

      assert_select "input#order_delivery_type[name=?]", "order[delivery_type]"
    end
  end
end
