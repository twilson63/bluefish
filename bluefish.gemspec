# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bluefish}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Wilson"]
  s.date = %q{2009-06-21}
  s.email = %q{tom@jackhq.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "bluefish.gemspec",
     "lib/bluefish.rb",
     "spec/bluefish_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/twilson63/bluefish}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Simple Document Data Driver}
  s.test_files = [
    "spec/bluefish_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
