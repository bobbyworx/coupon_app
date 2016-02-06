class Coupon < ActiveRecord::Base

  belongs_to :variant

  validates :code, presence: true
# validates :code, :format => { :with => /\A(?=.*[a-z])[a-z\d]+\Z/i }

  def self.generate_code(variant)
    new_coupon = self.new(code: SecureRandom.urlsafe_base64, variant_id: variant.id)
    new_coupon.save!
  end
end
