json.array!(@orders) do |order|
  json.extract! order, :id, :fname, :lname, :company, :street, :city, :zip, :phone, :mail, :pay_type, :delivery_type
  json.url order_url(order, format: :json)
end
