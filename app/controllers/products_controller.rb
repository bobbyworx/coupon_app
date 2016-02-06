class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :show, :destroy, :buy_product]
  before_action :authenticate_buyer!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product #{@product.title} was successfully created!"
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product #{@product.title} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product #{@product.title} was deleted!"
  end

  def buy_product
    if current_buyer.credits < @product.variants.where(:is_active => true).map(&:price).min
      redirect_to products_path, error: 'Not enough credits to purchase this item!'
    else
      current_buyer.orders.create( product_id: @product.id )
      redirect_to products_path, notice: "Product #{@product.title} bought! #{current_buyer.credits} remaining!"
    end
  end

private

  def product_params
    params.require(:product).permit(:title, :description)
  end

  def find_product
    @product ||= Product.find(params[:id])
  end
end
