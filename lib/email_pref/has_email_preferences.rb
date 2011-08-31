module EmailPref
  
  module HasEmailPreferences
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      
      def has_email_preferences(klazz = 'EmailPreference')
        
        has_one :email_preference, :as => :emailable, :class_name => klazz.to_s, :dependent => :destroy
        after_create :create_email_preference
        accepts_nested_attributes_for :email_preference
        attr_accessible :email_preference_attributes
        
        include InstanceMethods
      end
      
    end
    
    module InstanceMethods
      
      def can_email?(key)
        !self.email_preference || self.email_preference.can?(key)
      end
      
      protected
      
      def create_email_preference
        self.email_preference.create
      end
      
    end
    
  end
  
  
end