require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles
  
  ###
  # Relationships
  
  has_many :works, :order => "created_at DESC"
  has_one :bio
  delegate :name, :to => :bio
  
  ###
  # Validation

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD
  
  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :email, :password, :password_confirmation

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(email, password)
    u = find_in_state :first, :active, :conditions => {:email => email} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def has_role?(role)
    return self.send(:"#{role}?") if self.respond_to?(:"#{role}?")
  end
  
  def clear_reset_code!
    self.reset_code = nil
    save(false)
  end
  
  def recently_reset_password?
    @reset_code_set
  end
  
  def make_reset_code!
    @reset_code_set = true
    self.reset_code = self.class.make_token
    save(false)
  end

protected
  
  def make_activation_code
    self.deleted_at = nil
    self.activation_code = self.class.make_token
  end
  
end
