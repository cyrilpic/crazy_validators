require 'helper'
require 'fixtures/word_count_model'

class TestWordCountValidator < Test::Unit::TestCase
  include ActiveModel::Lint::Tests
  def setup
    @model = WordCountModel.new
  end
  
  should "only validate valid input between 5 and 10 words" do
    text2 = "Hello World"
    text4 = "Hello World from home."
    text5 = "Hello World from my home."
    text11 = "Hello World from my very sweet home in Switzerland, Geneva Lake."
    
    model.minmax = text5
    model.exact = text2
    assert !model.valid?
    
    model.exact = text11
    assert !model.valid?
    
    model.exact = text4
    assert !model.valid?
    
    model.exact = text5
    assert model.valid?
    
    model.minmax = text2
    assert !model.valid?
    
    model.minmax = text4
    assert !model.valid?
    
    model.minmax = text11
    assert !model.valid?
  end
  
end