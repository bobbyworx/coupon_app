require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should not save coupon without a code" do
    product = Product.new
    assert_not product.save
  end

end
