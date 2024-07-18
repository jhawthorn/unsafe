# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"
require "minitest/test_task"

task build: :compile

GEMSPEC = Gem::Specification.load("unsafe.gemspec")

Rake::ExtensionTask.new("unsafe", GEMSPEC) do |ext|
  ext.lib_dir = "lib/unsafe"
end

Minitest::TestTask.create

task default: %i[clobber compile test]
