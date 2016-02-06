class Product < ActiveRecord::Base
  validates :product, presence: true
end
