#!/usr/bin/env rake

require 'rake'
require 'rspec/core/rake_task'

task spec: 'spec:all'
task default: [:spec, :foodcritic]

desc 'foodcritic'
task :foodcritic do |_t|
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
      # "FC008: Generated cookbook metadata needs updating" is for handson
          sh "foodcritic -f any #{File.dirname(__FILE__)}"
            else
                puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
                  end
                  end

namespace :spec do
  targets = []
    Dir.glob('./spec/*').each do |dir|
        next unless File.directory?(dir)
            target = File.basename(dir)
                target = "_#{target}" if target == 'default'
                    targets << target
                      end

  task all: targets
    task default: :all

  targets.each do |target|
      original_target = target == '_default' ? target[1..-1] : target
          desc "Run serverspec tests to #{original_target}"
              RSpec::Core::RakeTask.new(target.to_sym) do |t|
                    ENV['TARGET_HOST'] = original_target
                          t.pattern = "spec/#{original_target}/*_spec.rb"
                              end
                                end
