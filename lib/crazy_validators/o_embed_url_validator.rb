require 'active_model'
require 'oembed'
module CrazyValidators
  class OEmbedUrlValidator < ActiveModel::EachValidator
    
    RESERVED_OPTIONS  = [:type, :success]
    AUTHORIZED_TYPES = ['video', 'link', 'photo', 'rich']
    
    def initialize(options)
      super
    end
    
    def validate_each(record, attribute, value)
      error_options = options.except(RESERVED_OPTIONS)
      type = [options[:type]].flatten.map(&:to_s).keep_if do |e|
        AUTHORIZED_TYPES.include? e
      end
      if record.send(attribute + "_changed?")
        OEmbed::Providers.register_all
        begin
          res = OEmbed::Providers.get(value)
          if type.any? { |t| res.send(t+'?') }
            unless options[:success].nil?
              if options[:success].is_a? Proc
                options[:success].call(res)
              else
                record.send(options[:success].to_sym, res)
              end
            end
          else
            error_options[:required_type] = type.join(", ")
            record.errors.add(attribute, :oembed_not_right_type, error_options)
          end
        rescue OEmbed::Error => e
          record.errors.add(attribute, :oembed_error, error_options)
        end
      end
    end
  end
end