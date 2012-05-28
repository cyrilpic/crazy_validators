require 'helper'
require 'fixtures/boolean_model'

class TestBooleanValidator < Test::Unit::TestCase
  include ActiveModel::Lint::Tests
  def setup
    BooleanModel.validates :boolean, boolean: true
    @model = BooleanModel.new
  end
  should "only accept boolean values" do
    model.boolean = false
    assert model.valid?
    model.boolean = true
    assert model.valid?
    model.boolean = nil
    assert !model.valid?
    assert_equal model.errors[:boolean], ["should be yes or no"]
  end
end