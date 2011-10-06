require File.dirname(__FILE__) + '/../init'
  
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => '/tmp/email_pref.sqlite')
ActiveRecord::Migration.verbose = false
ActiveRecord::Base.default_timezone = :utc if Time.zone.nil?
ActionMailer::Base.perform_deliveries = false

require File.dirname(__FILE__) + '/sandbox/db/schema.rb'

class TestEmailPreference < EmailPref::EmailPreference
  
  def self.keys
    [:media, :comments, :config]
  end
end

class Account < ActiveRecord::Base
  has_email_preferences 'TestEmailPreference'
  attr_accessible :name
end