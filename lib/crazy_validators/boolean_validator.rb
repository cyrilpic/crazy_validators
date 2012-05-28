require 'active_model'
module CrazyValidators
  class BooleanValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value.is_a?(TrueClass) || value.is_a?(FalseClass)
        record.errors.add(attribute, :not_boolean, options)
      end
    end    
  end
end