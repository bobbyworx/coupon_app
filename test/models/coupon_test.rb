require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save coupon without a code" do
    coupon = Coupon.new
    assert_not coupon.save
  end


end
