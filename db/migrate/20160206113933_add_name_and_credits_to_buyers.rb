class AddNameAndCreditsToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :name, :string
    add_column :buyers, :credits, :integer, :default => 100
  end
end
