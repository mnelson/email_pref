module EmailPref
  
  class EmailPreference < ActiveRecord::Base
    
    belongs_to :emailable, :polymorphic => true
    validates :emailable, :presence => true
    
    serialize :settings, Hash
    after_initialize :construct_settings
    
    def self.keys
      []
    end
    
    def self.has_unsubscribe_column?
      self.respond_to?(:unsubscribe_all)
    end
    
    def construct_settings
      self.settings = Hash[*self.class.setting_keys.map{|k| [k, true] }.flatten].merge(self.settings || {})
    end
    
    def unsubscribe_all?
      !self.class.has_unsubscribe_column? || self.unsubscribe_all 
    end
    
    def unsubscribe!
      if self.class.has_unsubscribe_column?
        self.update_attribute(:unsubscribe_all, true)
      else
        self.class.keys.each{|k| self.settings[k] = false}
        self.save
      end
    end
    
    def can?(key)
      !self.unsubscribe_all? && (key.nil? || !self.settings.has_key?(key.to_sym) || self.settings[key.to_sym])
    end
    
    def describe(key)
      key.to_s.humanize.capitalize
    end
  
  end

end