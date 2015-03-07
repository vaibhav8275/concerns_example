class Transaction < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :order_id, :presence => true
  validates :product_id, :presence => true
  
  before_create do
    self.amount = self.product.price if self.amount.blank?
  end
end
