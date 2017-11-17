class Attributeproduct < ApplicationRecord
  belongs_to :typeproduct
  belongs_to :feature
  has_many :informationquotes
end
