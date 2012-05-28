require 'fixtures/simple_model'
class WordCountModel < SimpleModel
  attributes :minmax
  validates :minmax, word_count: { maximum: 10, minimum: 5 }
  attributes :exact
  validates :exact, word_count: { is: 5 }
end
