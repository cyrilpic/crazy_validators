class SimpleModel
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  def initialize(attributes = {})
    attributes.each do |attr, value|
      self.send("#{attr}=", value)
    end unless attributes.blank?
  end

  def persisted?
    false
  end

  # 1) Define a class inheritable attribute named _attributes
  # Let's use underscore to mark this method as internal to our gem
  class_attribute :_attributes
  self._attributes = []

  attribute_method_prefix 'clear_'
  attribute_method_suffix '?'

  def self.attributes(*names)
    attr_accessor *names
    define_attribute_methods names

    # 2) Add declared attributes to the list
    self._attributes += names
  end

  # 3) Create the attributes hash by iterating the list
  def attributes
    self._attributes.inject({}) do |hash, attr|
      hash[attr.to_s] = send(attr)
      hash
    end
  end

  protected

  def clear_attribute(attribute)
    send("#{attribute}=", nil)
  end

  def attribute?(attribute)
    send(attribute).present?
  end
end