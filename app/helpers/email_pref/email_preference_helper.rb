module EmailPref
  module EmailPreferenceHelper
    
    def email_pref_short_errors(instance)
      return nil if instance.nil?
      by_name = {}
      instance.errors.each{ |name, msg| (by_name[name] ||= []) << msg }
      raw by_name.map{ |name, msgs| "#{name == :base ? '' : instance.class.human_attribute_name(name.to_s.gsub(/^.*\./, ''))} #{msgs.join(' & ')}"}.join("; ")
    end
    
  end
end