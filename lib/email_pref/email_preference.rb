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
      self.column_names.include?('unsubscribe_all')
    end
    
    def self.describe(key)
      key.to_s.humanize.capitalize
    end
    
    def construct_settings
      self.settings = Hash[*self.class.keys.map{|k| [k, true] }.flatten].merge(self.settings || {})
    end
    
    def unsubscribed?
      self.class.has_unsubscribe_column? && self.unsubscribe_all 
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
      !self.unsubscribed? && (key.nil? || !self.settings.has_key?(key.to_sym) || self.settings[key.to_sym])
    end
    
    def method_missing(method_name, *args)
      # Let AR do it's stuff then handle a failure
      begin
        super
      rescue NoMethodError => exc
        if self.settings && method_name.to_s =~ /^(#{self.class.keys.join('|')})(\?|\=)?$/
          if $2 == '='
            self.set($1, *args)
          else
            self.can?($1)
          end
        else
          super
        end
      end

    end

    def respond_to?(method_name, include_private = false)
      super || self.settings && method_name.to_s =~ /^(#{self.class.keys.join('|')})[\?\=]?$/
    end
    
    protected
    
    def set(key, value)
      value = %w(1 t true yes y).include?(value.to_s)
      self.unsubscribe_all = false if value
      self.settings ||= {}
      self.settings[key.to_sym] = value
    end
  
  end

end