# frozen_string_literal: true

require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
