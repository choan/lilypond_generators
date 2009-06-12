# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lilypond_generators}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Choan Gálvez"]
  s.date = %q{2009-03-31}
  s.description = %q{Rubigen based generators for lilypond projects}
  s.email = %q{choan.galvez@gmail.com}
  s.files = %w[app_generators app_generators/lilypond_score app_generators/lilypond_score/lilypond_score_generator.rb app_generators/lilypond_score/templates app_generators/lilypond_score/templates/defs.lyi app_generators/lilypond_score/templates/header.lyi app_generators/lilypond_score/templates/instrument.ly app_generators/lilypond_score/templates/instrument.lyi app_generators/lilypond_score/templates/part.lyi app_generators/lilypond_score/templates/score_mvt.ly app_generators/lilypond_score/USAGE bin bin/newly lib lib/lilypond_generators.rb Rakefile tasks tasks/templates tasks/templates/gemspec.erb]
  s.executables = %w[newly ]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/choan/lilypond_generators}
  s.bindir = "bin"
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  # s.rubyforge_project = %q{lilypond_generators}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Rubigen based generators for lilypond projects}
  s.add_dependency("rubigen")
end
