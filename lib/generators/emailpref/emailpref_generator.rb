require 'rails/generators'
require 'rails/generators/migration'

class EmailprefGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  
  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
    
  def create_model_file
    migration_template "migration.rb", "db/migrate/create_email_preferences.rb"
  end
  
end