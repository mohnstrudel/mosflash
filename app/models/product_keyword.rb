class ProductKeyword < ActiveRecord::Base
  belongs_to :product
  belongs_to :keyword
end
