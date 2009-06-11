require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Issue do
  fixtures :issues
  
  before(:each) do
    @valid_attributes = {
      :number => 19,
      :color => "ff00ff",
      :title => "Aug 2011",
      :subtitle => "Awesome issue, grab it now bitches."
    }
  end

  it "should be valid given valid attributes" do
    Issue.new(@valid_attributes).should be_valid
  end
  
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number) }
  
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title, :maximum => 32)}
  
  it { should validate_presence_of(:subtitle) }
  it { should validate_length_of(:subtitle, :maximum => 128)}
  
  it { should validate_presence_of(:color) }
  it { should validate_length_of(:color, :within => 6..6)}
  
  it { should have_many(:works) }
  
  it "should not be published if it has no published date" do
    Issue.new(:published_at => nil).should_not be_published
  end
  
  it "should not be published if it has a published date in the future" do
    Issue.new(:published_at => Time.now + 1.day).should_not be_published
  end

  it "should be published if it has a published date in the past" do
    Issue.new(:published_at => Time.now - 1.day).should be_published
  end

  it "should find all published issues" do
    Issue.published.should include(issues(:issue_1))
    Issue.published.should include(issues(:issue_2))
    Issue.published.should_not include(issues(:issue_3)) # future
    Issue.published.should_not include(issues(:issue_4)) # nil
  end
  
  it "should find all issues after a certain number" do
    Issue.since_number(0).should include(issues(:issue_1))
    Issue.since_number(0).should include(issues(:issue_2))
    Issue.since_number(1).should_not include(issues(:issue_1))
    Issue.since_number(1).should include(issues(:issue_2))
  end
  
  it "should order issues by number" do
    Issue.all.should == [issues(:issue_1), issues(:issue_2), issues(:issue_3), issues(:issue_4)]
  end
end
