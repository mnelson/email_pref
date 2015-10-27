# -*- encoding: utf-8 -*-
# stub: email_pref 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "email_pref"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Nelson"]
  s.date = "2011-09-21"
  s.email = "mike@mikeonrails.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc", "app/controllers/email_pref/email_preferences_controller.rb", "app/helpers/email_pref/email_preference_helper.rb", "app/views/email_pref/email_preferences/_edit.html.erb", "app/views/email_pref/email_preferences/edit.html.erb", "config/routes.rb", "lib/email_pref.rb", "lib/email_pref/email_preference.rb", "lib/email_pref/engine.rb", "lib/email_pref/has_email_preferences.rb", "lib/email_pref/interceptor.rb", "lib/email_pref/mail_permissions.rb", "lib/generators/emailpref/emailpref_generator.rb", "lib/generators/emailpref/templates/migration.rb"]
  s.homepage = "http://github.com/mnelson/email_pref"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Email Preferences for AR Objects"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end
