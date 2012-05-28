require 'helper'
require 'fixtures/string_model'

class TestSlugValidator < Test::Unit::TestCase
  include ActiveModel::Lint::Tests
  def setup
    StringModel.validates :string, slug: true
    @model = StringModel.new
  end
  should "only accept valid slug" do
    model.string = "This is @ regular sentance !"
    assert !model.valid?, "Provided a sentance instead of a slug"
    model.string = "This is @ regular sentance !".to_slug
    assert model.valid?
  end
end
