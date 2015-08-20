require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fname/)
    expect(rendered).to match(/Lname/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Mail/)
    expect(rendered).to match(/Pay Type/)
    expect(rendered).to match(/Delivery Type/)
  end
end
