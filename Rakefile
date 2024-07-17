# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("unsafe.gemspec")

Rake::ExtensionTask.new("unsafe", GEMSPEC) do |ext|
  ext.lib_dir = "lib/unsafe"
end

task default: %i[clobber compile]
