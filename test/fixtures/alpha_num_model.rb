require 'fixtures/simple_model'
class AlphaNumModel < SimpleModel
  attributes :attri
  validates :attri, alpha_numericality: true
end
