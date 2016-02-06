class Variant < ActiveRecord::Base

  belongs_to :product
  has_many :coupons

  validates_presence_of :is_active, :price, :quantity
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :min_price, -> { where("is_active = ? AND price = ?",  true, Variant.all.map(&:price).min) }

  STATUSES = ['true', 'false']

end
