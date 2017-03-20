class SaleItem < ApplicationRecord
  belongs_to :product
  belongs_to :sale

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validates :sale_present
  before_save :finalize

  def total_price 
  	unit_price * quantity
  end

private
  def finalize
  	self[:unit_price] = unit_price
  	self[:total_price] = quantity * self[:unit_price]
  end
end
