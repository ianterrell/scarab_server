module PublishedModel
  module ClassMethods
    def is_a_published_model
      default_scope :order => :number
      named_scope :published, lambda { { :conditions => ["published_at <= ?", Time.now.utc] } }
      named_scope :since_number, lambda { |number| { :conditions => ["number > ?", number] } }
      
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    def published?
      published_at && published_at <= Time.now
    end
    
    def publication_scheduled?
      !published_at.nil?
    end
  end
end