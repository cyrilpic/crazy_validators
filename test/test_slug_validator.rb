require 'helper'
require 'fixtures/slug_model'

class TestSlugValidator < Test::Unit::TestCase
  include ActiveModel::Lint::Tests
  def setup
    @model = SlugModel.new
  end
  should "only accept valid slug" do
    model.slug = "This is @ regular sentance !"
    assert !model.valid?, "Provided a sentance instead of a slug"
    model.slug = "This is @ regular sentance !".to_slug
    assert model.valid?
  end
end
