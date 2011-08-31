module EmailPref
  class Interceptor

    def self.delivering_email(mail)
      mail.delivery_handler = self
    end

    def self.deliver_mail(mail)
      
      if mail.to.respond_to?(:can_email?)
        mail.perform_deliveries = mail.perform_deliveries && (mail.permit.nil? || mail.to.can_email?(mail.permit))
      end
      yield mail
    end

  end
end