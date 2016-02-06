class Variant < ActiveRecord::Base
  validates_presence_of :is_active, :price, :quantity
end
