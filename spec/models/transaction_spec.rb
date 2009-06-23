require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Transaction do
  before(:each) do
    @valid_attributes = {
      :issue_id => 1,
      :quantity => 1,
      :identifier => "foo",
      :product_identifier => "foo",
      :app_identifier => "foo",
      :version_external_identifier => "foo",
      :purchased_at => Time.now
    }
  end

  it "should be valid given valid attributes" do
    Transaction.new(@valid_attributes).should be_valid
  end
  
  it { should belong_to(:issue) }
  it { should belong_to(:original_transaction) }
  
  it { should validate_presence_of(:issue_id) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:identifier) }
  it { should validate_presence_of(:product_identifier) }
  it { should validate_presence_of(:app_identifier) }
  it { should validate_presence_of(:version_external_identifier) }
  it { should validate_presence_of(:purchased_at) }

end
