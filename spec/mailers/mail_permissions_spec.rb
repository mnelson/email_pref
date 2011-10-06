require 'database'

describe EmailPref::EmailPreference do
  
  class PrefMailer < ActionMailer::Base
    include EmailPref::MailPermissions 
    
    def something
      @account = Account.create(:name => 'test')
      mail(:to => @account, :subject => 'Test Email', :permit => :comments) do |format|
        format.text { render :text => 'Hello there sonny' }
      end
    end
    
    def before_mail(options)
      super
      options.merge!(:to => options[:to].map{|o| "#{o.name}@gmail.com"})
    end
    
  end
  
  
  context "mailer" do
    
    it "should not allow the email to be sent if the permissions do not allow" do
      PrefMailer.something.deliver
    end
    
  end
  
end