require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MailingListRecipient do
  before(:each) do
    @valid_attributes = {
      :email => "jeff@bozek.com"
    }
  end

  it "should be valid with valid attributes" do
    MailingListRecipient.new(@valid_attributes).should be_valid
  end

  ###
  # Email validation

  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email, :maximum => 128) }
  
  it "should disallow invalid email addresses" do
    ['!!@nobadchars.com', 'foo@no-rep-dots..com', 'foo@badtld.xxx', 'foo@toolongtld.abcdefg',
     'Iñtërnâtiônàlizætiøn@hasnt.happened.to.email', 'need.domain.and.tld@de', "tab\t", "newline\n",
     'r@.wk', 'uucp!addr@gmail.com', 'semicolon;@gmail.com', 'quote"@gmail.com', 'tick\'@gmail.com', 'backtick`@gmail.com', 'space @gmail.com', 'bracket<@gmail.com', 'bracket>@gmail.com'
    ].each do |email|
      MailingListRecipient.new(@valid_attributes.merge({:email => email})).should_not be_valid
    end
  end
  
  it "should allow valid email addresses" do
    ['foo@bar.com', 'foo@newskool-tld.museum', 'foo@twoletter-tld.de', 'foo@nonexistant-tld.qq',
     'r@a.wk', '1234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890@gmail.com',
     'hello.-_there@funnychar.com', 'uucp%addr@gmail.com', 'hello+routing-str@gmail.com',
     'domain@can.haz.many.sub.doma.in', 'student.name@university.edu'
    ].each do |email|
       MailingListRecipient.new(@valid_attributes.merge({:email => email})).should be_valid
    end
  end
end