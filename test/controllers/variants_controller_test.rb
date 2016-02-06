require 'test_helper'

class VariantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create variant" do
  assert_difference('Variant.count') do
    post :create, variant: {title: 'ABC'}
  end

    assert_redirected_to variants_path(assigns(:variant))
  end
end
