require 'fixtures/simple_model'
class SlugModel < SimpleModel
  attributes :slug
  validates :slug, slug: true
end