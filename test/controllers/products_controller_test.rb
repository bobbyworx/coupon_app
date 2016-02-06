require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
   test "should create product" do
    assert_difference('Product.count') do
      post :create, product: {title: 'ABC'}
    end

    assert_redirected_to products_path(assigns(:product))
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
