class CreateEmailPreferences < ActiveRecord::Migration
  def self.up
    create_table :email_preferences, :force => true do |t|
      t.references  :emailable, :polymorphic => true
      t.text        :settings
      t.boolean     :unsubscribe_all
      t.string      :type
      
      t.timestamps
    end

    add_index :email_preferences, [:emailable_id, :emailable_type]
  end

  def self.down
    drop_table :email_preferences
  end
end