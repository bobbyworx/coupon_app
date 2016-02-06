class AddVariantToCoupons < ActiveRecord::Migration
  def change
    add_reference :coupons, :variant, index: true, foreign_key: true
  end
end
