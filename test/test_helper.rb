require 'simplecov'
SimpleCov.start

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'

lib_dir = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
