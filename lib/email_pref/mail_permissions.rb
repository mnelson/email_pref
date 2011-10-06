module EmailPref
  module MailPermissions
    
    def mail(options = {})
      self.before_mail(options)
      mail = super
      self.after_mail(mail)
      mail
    end
    
    def before_mail(options)
      filter_recipients(options)
    end
    
    def after_mail(mail)
      mail.perform_deliveries = mail.perform_deliveries && !mail.to.blank?
    end
    
    protected
    
    def filter_recipients(options)
      return if options[:permit].blank?
      puts options.to_yaml.gsub("\n", '<br />')
      options.merge!(:to => [options[:to] || options['to']].flatten.select{|r| !r.respond_to?(:can_email?) || r.can_email?(options[:permit]) }.compact)
    end
    
  end
end