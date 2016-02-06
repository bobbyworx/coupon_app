class Product < ActiveRecord::Base
  has_many :variants
  has_many :orders
  has_many :buyers, through: :orders

  validates :title, presence: true

end
