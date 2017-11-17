class Product < ApplicationRecord
  has_many :typeproducts
  has_many :quotes
end
