require 'database'

describe EmailPref::EmailPreference do
  
  class PrefMailer < ActionMailer::Base
    include EmailPref::MailPermissions 
    
    def something(account)
      mail(:to => account, :from => 'test@test.com', :subject => 'Test Email', :permit => :comments) do |format|
        format.text { render :text => 'Hello there sonny' }
      end
    end
    
    def before_mail(options)
      super
      options.merge!(:to => [options[:to]].flatten.map{|o| "#{o.name}@gmail.com"})
    end
    
  end
  
  
  context "mailer" do
    
    it "should not allow the email to be sent if the permissions do not allow" do
      account = Account.create!(:name => 'test')
      mail = PrefMailer.something(account).deliver
      mail.to.should eql(['test@gmail.com'])
      account.email_preference.comments = false
      account.email_preference.save
      account.reload
      mail = PrefMailer.something(account).deliver
      mail.to.should be_empty
    end
    
  end
  
end