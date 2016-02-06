class VariantsController < ApplicationController
  before_action :find_variant, only: [:edit, :update, :show, :destroy]

  def new
    @variant = Variant.new
  end

  def create
    @variant = Variant.new(variant_params)
    if @variant.save
      redirect_to variants_path, notice: "Variant #{@variant.title} was successfully created!"
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @variants = Variant.all
  end

  def edit
  end

  def update
    if @variant.update(variant_params)
      redirect_to variants_path, notice: "Variant #{@variant.title} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @variant.destroy
    redirect_to variants_path, notice: "Variant #{@variant.user_name} was deleted!"
  end

private

  def variant_params
    params.require(:variant).permit(:product_id, :is_active, :price, :quantity)
  end

  def find_variant
    @variant ||= Variant.find(params[:id])
  end

end
