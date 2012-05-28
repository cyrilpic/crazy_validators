# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "crazy_validators"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cyril Picard"]
  s.date = "2012-05-28"
  s.description = " CrazyValidators enables easy validation of attributs of an ActiveModel class, such as alphanumericality, presence in a Blacklist. "
  s.email = "Cyril@picard.ch"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "crazy_validators.gemspec",
    "lib/crazy_validators.rb",
    "lib/crazy_validators/.DS_Store",
    "lib/crazy_validators/alpha_numericality_validator.rb",
    "lib/crazy_validators/blacklist/default.yml",
    "lib/crazy_validators/blacklist_validator.rb",
    "lib/crazy_validators/boolean_validator.rb",
    "lib/crazy_validators/o_embed_url_validator.rb",
    "lib/crazy_validators/slug_validator.rb",
    "lib/crazy_validators/word_count_validator.rb",
    "locales/en.yml",
    "locales/fr.yml",
    "test/fixtures/boolean_model.rb",
    "test/fixtures/simple_model.rb",
    "test/fixtures/string_model.rb",
    "test/helper.rb",
    "test/test_boolean_validator.rb",
    "test/test_crazy_validators.rb",
    "test/test_slug_validator.rb",
    "test/test_word_count_validator.rb"
  ]
  s.homepage = "http://github.com/cyrilpic/crazy_validators"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.19"
  s.summary = "Adds some validation methods for ActiveModel models"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<to_slug>, [">= 0"])
      s.add_development_dependency(%q<ruby-oembed>, [">= 0"])
    else
      s.add_dependency(%q<activemodel>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<to_slug>, [">= 0"])
      s.add_dependency(%q<ruby-oembed>, [">= 0"])
    end
  else
    s.add_dependency(%q<activemodel>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<to_slug>, [">= 0"])
    s.add_dependency(%q<ruby-oembed>, [">= 0"])
  end
end

