require 'active_model'

module CrazyValidators
  class AlphaNumericalityValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      
      return if value.nil?
      
      unless value.to_s.match(/^\w+$/)
        record.errors.add(attribute, :not_alpha_numeric, options)
      end
    end
  end
end