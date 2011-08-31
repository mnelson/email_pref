module EmailPref
  module MailPermissions
    
    def perform_deliveries
      to = self.to
      super && (to.nil? || self[:permit].nil? || !to.respond_to?(:can_email?) || to.can_email?(self[:permit]))
    end
    
  end
end