require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Question do
  before(:each) do
    @valid_attributes = {
      :body => "value for body",
      :answer => "value for answer",
      :position => 1,
      :category_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end
end
