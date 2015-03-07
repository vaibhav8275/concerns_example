# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Nixon Rotolog Watch"
    price "200"
    cost "150"
    quantity_in_stock 1
    quantity_on_order 1
  end
end
