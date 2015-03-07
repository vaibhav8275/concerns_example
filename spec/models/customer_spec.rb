require 'spec_helper'

describe Customer do
  it { should have_many(:orders) }
  it { should have_many(:transactions).through(:orders) }
end
