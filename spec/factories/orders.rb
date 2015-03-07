# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer_id 1
    factory :order_with_transactions do
      before(:create) do |order, evaluator|
        product = FactoryGirl.create(:product)
        order.transactions << FactoryGirl.create_list(:transaction, 5, product: product)
      end
    end
  end

end
