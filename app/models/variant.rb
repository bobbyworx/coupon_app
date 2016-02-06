class Variant < ActiveRecord::Base

  belongs_to :product
  has_many :coupons

  validates_presence_of :is_active, :price, :quantity
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  STATUSES = ['true', 'false']

end
