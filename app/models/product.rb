class Product < ActiveRecord::Base
  include Statusable
  
  status_attrs "in_stock", "out_of_stock", "on_order", :default_status => "in_stock"
  
  has_many :transactions
end
