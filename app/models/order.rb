class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :transactions
  
  before_create do
    self.total_amount = calculate_total_amount
  end
  
  def calculate_total_amount
    transactions.map(&:amount).reduce(:+)
  end
end
