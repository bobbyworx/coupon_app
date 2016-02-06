class Variant < ActiveRecord::Base

  has_many :coupons

  validates_presence_of :is_active, :price, :quantity
end
