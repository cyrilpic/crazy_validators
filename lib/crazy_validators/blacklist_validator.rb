require 'active_model'

module CrazyValidators
  class BlacklistValidator < ActiveModel::EachValidator
    
    RESERVED_OPTIONS  = [:with_array, :with_model, :with_file, :type]
    
    DEFAULT_FILE = File.join(File.dirname(__FILE__), 'blacklist', 'default.yml')
    DEFAULT_TYPE = :equals
    
    def initialize(options)
      super
    end
    
    def validate_each(record, attribute, value)
      @blacklist = load_blacklist
      type = (options[:type] || DEFAULT_TYPE)
      error_options = options.except(RESERVED_OPTIONS)
      if type == :contains
        @blacklist.each do |el|
          if value.to_s.include? el
            error_options[:word] = value.to_s
            record.errors.add(attribute, :contains_blacklist, error_options)
            break
          end
        end
      else
        value.to_s.split(/'| /).each do |el|
          if @blacklist.include? el
            error_options[:word] = el.to_s
            record.errors.add(attribute, :in_blacklist, error_options)
            break
          end
        end
      end
    end
    private
    def load_blacklist()
      if options.key? :with_array
        raise ArgumentError, ":with_array must contain an array" unless options[:with_array].is_a?(Array)
        return options[:with_array]
      elsif options.key? :with_model
        model = options[:with_model]
        if model.is_a?(String) || model.is_a?(Symbol)
          model = model.to_s.camelize.constantize
        end
        raise ArgumentError, ":with_model must be a model (does not respond to 'all')" unless model.respond_to? :all
        array = []
        list = model.all
        list.each do |record|
          array << record.name
        end
        return array
      elsif options.key? :with_file
        raise ArgumentError, ":with_file does not point to an existing file" unless File.exists?(options[:with_file])
        hash = YAML::load_file(options[:with_file])
        raise ArgumentError, ":with_file file does not contain an array called blacklist" unless hash.key?(:blacklist) && hash.is_a?(Array)
        return hash["blacklist"]
      else
        hash = YAML::load_file(DEFAULT_FILE)
        return hash["blacklist"]
      end
    end
  end
end