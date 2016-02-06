class Coupon < ActiveRecord::Base

  belongs_to :variant

  validates :code, presence: true
  validates :code, :format => { :with => /\A(?=.*[a-z])[a-z\d]+\Z/i }
end
