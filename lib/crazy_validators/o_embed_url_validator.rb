require 'active_model'
require 'oembed'
module CrazyValidators
  class OEmbedUrlValidator < ActiveModel::EachValidator
    
    RESERVED_OPTIONS  = [:type]
    AUTHORIZED_TYPES = ['video', 'link', 'photo', 'rich']
    
    def initialize(options)
      super
    end
    
    def validate_each(record, attribute, value)
      error_options = options.except(RESERVED_OPTIONS)
      type = [options[:type]].flatten.map(&:to_s).keep_if do |e|
        AUTHORIZED_TYPES.include? e
      end
      OEmbed::Providers.register_all
      begin
        res = OEmbed::Providers.get(value)
        unless type.any? { |t| res.call(t+'?') }
          error_options[:required_type] = type.join(", ")
          record.errors.add(attribute, :oembed_not_right_type, error_options)
        end
      rescue OEmbed::Error => e
        record.errors.add(attribute, :oembed_error, error_options)
      end
    end
  end
end