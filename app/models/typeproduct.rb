class Typeproduct < ApplicationRecord
  belongs_to :product
  has_many :attributeproducts
end
