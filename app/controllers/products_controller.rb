class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :show, :destroy]

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
    redirect_to products_path, notice: "Product #{@product.user_name} was deleted!"
  end

private

  def product_params
    params.require(:product).permit(:title, :description)
  end

  def find_product
    @product ||= Product.find(params[:id])
  end
end
