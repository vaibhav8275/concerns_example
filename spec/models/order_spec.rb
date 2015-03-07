require 'spec_helper'

describe Order do
  it { should have_many(:transactions) }
  it { should belong_to(:customer) }
  
  subject { FactoryGirl.create(:order_with_transactions) }
  
  context "order with many transactions" do
    it { subject.transactions.length.should == 5 }
  end
  
  describe "#total_amount" do
    it "should equal the sum of all its transactions" do
      subject.total_amount.should == 1000
    end
  end
end
