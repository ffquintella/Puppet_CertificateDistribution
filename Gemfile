source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_from_env(env, default_location = [])
  if location = ENV[env]
    if location =~ /^((?:git|https?)[:@][^#]*)#(.*)/
      [{ :git => $1, :branch => $2, :require => false }]
    elsif location =~ /^file:\/\/(.*)/
      ['>= 0', { :path => File.expand_path($1), :require => false }]
    else
      [location, { :require => false }]
    end
  else
    default_location
  end
end

group :development, :unit_tests do
  gem 'metadata-json-lint'
  gem 'puppet_facts'
  gem 'puppet-blacksmith', '>= 3.4.0'
  gem 'puppetlabs_spec_helper', '>= 1.2.1'
  gem 'rspec-puppet', '>= 2.3.2'
  gem 'rspec-puppet-facts'
  gem 'simplecov'
  gem 'parallel_tests'
  gem 'rubocop', '0.41.2' if RUBY_VERSION < '2.0.0'
  gem 'rubocop' if RUBY_VERSION >= '2.0.0'
  gem 'rubocop-rspec', '~> 1.6' if RUBY_VERSION >= '2.3.0'
  gem 'json_pure', '<= 2.0.1' if RUBY_VERSION < '2.0.0'
end
group :system_tests do
  gem 'beaker', *location_from_env('BEAKER_VERSION', []) if RUBY_VERSION >= '2.3.0'
  gem 'beaker', *location_from_env('BEAKER_VERSION', ['< 3']) if RUBY_VERSION < '2.3.0'
  gem 'beaker-rspec', *location_from_env('BEAKER_RSPEC_VERSION', ['>= 3.4'])
  gem 'serverspec'
  gem 'beaker-puppet_install_helper'
  gem 'master_manipulator'
  gem 'beaker-hostgenerator', *location_from_env('BEAKER_HOSTGENERATOR_VERSION', [])
end

gem 'facter', *location_from_env('FACTER_GEM_VERSION')
gem 'puppet', *location_from_env('PUPPET_GEM_VERSION')

if File.exists? "#{__FILE__}.local"
  eval(File.read("#{__FILE__}.local"), binding)
end
