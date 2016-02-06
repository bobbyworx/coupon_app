class Order < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :product

  after_create :substract_credits

  def substract_credits
    credits = self.buyer.credits
    product_price = self.product.variants.where(:is_active => true).map(&:price).min
    credits_remaining = credits - product_price
    self.buyer.credits = credits_remaining
    self.buyer.save!
  end
end
