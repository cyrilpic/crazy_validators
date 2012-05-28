require 'helper'
require 'fixtures/alpha_num_model'

class TestAlphaNumericalityValidator < Test::Unit::TestCase
  include ActiveModel::Lint::Tests
  def setup
    @model = AlphaNumModel.new
  end
  
  should "only validate alpha numerical values" do
    model.attri = "Hello world"
    assert !model.valid?, model.errors[:attri].first
    model.attri = "hello"
    assert model.valid?
    model.attri = "hello45"
    assert model.valid?
  end
end