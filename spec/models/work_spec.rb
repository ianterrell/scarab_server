require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Work do
  before(:each) do
    @valid_attributes = {
      :title => "Light Purple",
      :body => "Red, White, and Blue",
      :issue_id => 1,
      :author_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Work.create!(@valid_attributes)
  end
  
  it { should validate_presence_of(:issue_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
