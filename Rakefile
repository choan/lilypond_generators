require "rake/clean"
require "lib/lilypond_generators.rb"

PROJECT_NAME = "lilypond_generators"
PROJECT_VERSION = LilypondGenerators::VERSION
PROJECT_DESCRIPTION = "Rubigen based generators for lilypond projects"
PROJECT_SUMMARY = "Rubigen based generators for lilypond projects"
PROJECT_HAS_RDOC = false
PROJECT_AUTHORS = [ "Choan Gálvez" ]
PROJECT_EMAIL = "choan.galvez@gmail.com"
PROJECT_HOMEPAGE = "http://github.com/choan/#{PROJECT_NAME}"
PROJECT_EXECUTABLES = %w[newly]


CLEAN.include("*.gem")

task :default

task :gemspec do
  require "erb"
  PROJECT_FILES_STR = FileList['**/**'].exclude(*%w[*.gemspec]).join(' ')
  File.open("#{PROJECT_NAME}.gemspec", "w") do |f| 
    f.puts ERB.new(File.read("tasks/templates/gemspec.erb")).result
  end
end

task :install => [ :uninstall, :build ] do
  sh "sudo gem install #{PROJECT_NAME}-#{PROJECT_VERSION}.gem"
end

task :build => [ :gemspec ] do
  sh "gem build #{PROJECT_NAME}.gemspec"
end

task :uninstall do
  sh "sudo gem uninstall #{PROJECT_NAME}"
end