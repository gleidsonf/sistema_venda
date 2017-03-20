class Sale < ApplicationRecord
  belongs_to :sale_status
  belongs_to :payment
  has_many :sale_items
  before_create :set_sale_status
  before_save :update_subtotal
  before_save :update_total

  scope :sale_last_week,->{
    where('created_at >= ?', 1.week.ago)
  }

  scope :sale_today, -> {
    where('created_at >= ?', Date.today)
  }

  def subtotal
  	sale_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private	
  def set_sale_status
  	self.sale_status_id = 2
    self.payment_id = 1
  end
  	
  def update_subtotal
  	self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = subtotal - discount
  end
end
