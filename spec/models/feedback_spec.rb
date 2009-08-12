require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Feedback do
  before(:each) do
    @valid_attributes = {
      :text => "value for text"
    }
  end

  it "should create a new instance given valid attributes" do
    Feedback.create!(@valid_attributes)
  end
end
