require 'database'

describe EmailPref::EmailPreference do
  
  context "model" do
    
    it "should default the settings hash based on the class keys" do
      t = TestEmailPreference.new
      t.settings.keys.map(&:to_s).sort.should eql(%w(comments config media))
    end
    
    it "should determine if the unsubscribe_all option exists" do
      TestEmailPreference.has_unsubscribe_column?.should be_true
    end
    
    it "should determine if it's unsubscribed or not" do
      t = TestEmailPreference.new
      t.unsubscribed?.should be_false
      t.media = false
      t.unsubscribed?.should be_false
      t.unsubscribe_all = true
      t.unsubscribed?.should be_true
    end
    
    it "should respond to can? properly" do
      t = TestEmailPreference.new
      t.media = false
      t.can?(:media).should be_false
      t.can?(:comments).should be_true
      t.unsubscribe_all = true
      t.can?(:comments).should be_false
    end
    
    it "should provide shortcut methods for each class key" do
      t = TestEmailPreference.new
      t.respond_to?(:comments?).should be_true
      t.comments?.should be_true
    end
    
  end
  
  context "mixin" do
    
    it "should create the preference when the account is created" do
      Account.create(:name => 'test').email_preference.should_not be_nil
    end
    
    it "should provide a can_email? method which calls upon the associated email preferences" do
      a = Account.create(:name => 'test')
      a.respond_to?(:can_email?).should be_true
      e = a.email_preference
      e.should_receive(:can?).with(:comments)
      a.can_email?(:comments)
    end
    
  end
  
end