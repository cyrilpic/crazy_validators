require 'helper'
require 'fixtures/simple_model'

class TestCrazyValidators < Test::Unit::TestCase
  should "be included in active_model validators" do
    assert ActiveModel::Validations::constants.include?(:AlphaNumericalityValidator)
    assert ActiveModel::Validations::constants.include?(:BlacklistValidator)
    assert ActiveModel::Validations::constants.include?(:BooleanValidator)
    assert ActiveModel::Validations::constants.include?(:OEmbedUrlValidator)
    assert ActiveModel::Validations::constants.include?(:SlugValidator)
    assert ActiveModel::Validations::constants.include?(:WordCountValidator)
  end
  should "be available in model" do
    assert SimpleModel.constants.include?(:AlphaNumericalityValidator)
    assert SimpleModel.constants.include?(:BlacklistValidator)
    assert SimpleModel.constants.include?(:BooleanValidator)
    assert SimpleModel.constants.include?(:OEmbedUrlValidator)
    assert SimpleModel.constants.include?(:SlugValidator)
    assert SimpleModel.constants.include?(:WordCountValidator)
  end
end