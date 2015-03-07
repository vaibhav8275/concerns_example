require 'spec_helper'

describe Transaction do
  it { should belong_to(:product) }
  it { should belong_to(:order) }
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:product_id) }
  
  subject { FactoryGirl.create(:transaction) }
  
  describe "#amount" do
    let(:default_product) { FactoryGirl.build(:product) }
    
    it "should be set to the products price by default" do
      subject.amount.should == default_product.price
    end
  end
end
