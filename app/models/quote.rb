class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :informationquotes
end
