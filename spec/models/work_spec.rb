require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Work do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :title => "My little pony",
      :agree_to_terms => true,
      :document_file_name => "test.pdf",
      :document_content_type => "application/pdf",
      :document_file_size => 1,
      :document_updated_at => Time.now
    }
  end

  it "should be valid given valid attributes" do
    w = Work.new(@valid_attributes)
    w.user_id = 1
    w.stub!(:bio_filled_out)
    w.should be_valid
  end
  
  it { should belong_to(:user) }
  it { should belong_to(:issue) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title, :maximum => 512) }
  
  it { should validate_presence_of(:agree_to_terms) }
  
  it "should protect user_id, issue_id, and state" do
    w = Work.new(@valid_attributes)
    w.user_id = 1
    w.attributes = { :title => "foo", :user_id => 2, :issue_id => 4, :state => 'stuff' }
    w.title.should == "foo"
    w.user_id.should == 1
    w.issue_id.should be_nil
    w.state.should be_nil
  end
  
  it "should validate that there is a bio for the user" do
    w = Work.new(@valid_attributes)
    w.user = User.new
    w.valid?
    w.should have(1).error_on(:base)
    w.user.stub!(:bio).and_return(Bio.new)
    w.valid?
    w.should have(0).errors_on(:base)
  end
end
