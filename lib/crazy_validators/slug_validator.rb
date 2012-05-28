require 'active_model'
require 'to_slug'

module CrazyValidators
  class SlugValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      
      return if value.nil?
      
      unless value.to_slug == value
        record.errors.add(attribute, :not_a_slug, options)
      end
    end
  end
end