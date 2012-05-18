module CrazyValidators
  class BooleanValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      value.is_a?(TrueClass) || value.is_a?(FalseClass)
    end    
  end
end