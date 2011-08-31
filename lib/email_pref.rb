require File.dirname(__FILE__) + '/email_pref/engine' if defined?(Rails)

autoload :ActiveRecord, 'active_record'
autoload :Mail, 'mail'

require File.dirname(__FILE__) + '/email_pref/email_preference'
require File.dirname(__FILE__) + '/email_pref/has_email_preferences'
require File.dirname(__FILE__) + '/email_pref/mail_permissions'
require File.dirname(__FILE__) + '/email_pref/interceptor'

::ActiveRecord::Base.send(:include, ::EmailPref::HasEmailPreferences)
::Mail::Message.send(:include, ::EmailPref::MailPermissions)