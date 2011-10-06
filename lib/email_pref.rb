require File.dirname(__FILE__) + '/email_pref/engine' if defined?(Rails)

autoload :ActiveRecord, 'active_record'
autoload :ActionMailer, 'action_mailer'
autoload :Mail, 'mail'

require File.dirname(__FILE__) + '/email_pref/email_preference'
require File.dirname(__FILE__) + '/email_pref/has_email_preferences'
require File.dirname(__FILE__) + '/email_pref/mail_permissions'

::ActiveRecord::Base.send(:include, ::EmailPref::HasEmailPreferences)