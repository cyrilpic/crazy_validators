require 'active_support'

module CrazyValidators
  extend ActiveSupport::Autoload

  autoload :SlugValidator
  autoload :OEmbedUrlValidator
end
require 'crazy_validators/boolean_validator'
require 'crazy_validators/blacklist_validator'
require 'crazy_validators/alpha_numericality_validator'
require 'crazy_validators/word_count_validator'


require 'active_support/i18n'
I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__), '../locales', '*.yml')).to_s]

ActiveModel::Validations.__send__(:include, CrazyValidators)