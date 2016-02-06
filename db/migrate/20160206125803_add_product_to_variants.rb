class AddProductToVariants < ActiveRecord::Migration
  def change
    add_reference :variants, :product, index: true, foreign_key: true
  end
end
