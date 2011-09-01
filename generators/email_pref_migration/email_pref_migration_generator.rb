class EmailPrefbMigrationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => 'create_email_preferences'
    end
  end
  
  def banner
    "Usage: #{$0} #{spec.name}"
  end
end