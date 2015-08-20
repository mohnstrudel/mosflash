require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

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
