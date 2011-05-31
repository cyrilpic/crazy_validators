require 'active_support'

module CrazyValidators
  extend ActiveSupport::Autoload
  
  autoload :AlphaNumericalityValidator
  autoload :WordCountValidator
  autoload :BlacklistValidator
end

require 'active_support/i18n'
I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__), '../locales', '*.yml')).to_s]