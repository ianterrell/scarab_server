require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bio do
  before(:each) do
    @valid_attributes = {
      :name => "Captain Planet",
      :phone => "5554441234",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    b = Bio.new(@valid_attributes)
    b.user_id = 1
    b.should be_valid
  end
  
  it { should belong_to(:user) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone) }
  it { should validate_length_of(:name, :maximum => 64) }
  it { should validate_length_of(:phone, :maximum => 16) }
  
  
  it "should protect user_id" do
    b = Bio.new(@valid_attributes)
    b.user_id = 1
    b.attributes = { :name => "foo", :user_id => 2 }
    b.name.should == "foo"
    b.user_id.should == 1
  end
end
