require 'active_model'

module CrazyValidators
  class WordCountValidator < ActiveModel::Validations::LengthValidator
    MESSAGES  = { :is => :word_wrong_length, :minimum => :word_too_short, :maximum => :word_too_long }.freeze
    
    # Copy of ActiveModel::Validations::LengthValidator
    def validate_each(record, attribute, value)
      value = word_tokenizer(value) if value.kind_of?(String)

      CHECKS.each do |key, validity_check|
        next unless check_value = options[key]

        value ||= [] if key == :maximum

        value_length = value.respond_to?(:length) ? value.length : value.to_s.length
        next if value_length.send(validity_check, check_value)

        errors_options = options.except(*RESERVED_OPTIONS)
        errors_options[:count] = check_value

        default_message = options[MESSAGES[key]]
        errors_options[:message] ||= default_message if default_message

        record.errors.add(attribute, MESSAGES[key], errors_options)
      end
    end
    
    private
    def word_tokenizer(value)
      value.split(' ')
    end
  end
end