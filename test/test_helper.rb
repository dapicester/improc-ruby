$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'improc'

Dir['test/support/**/*.rb'].each { |f| load f }

require 'byebug'
require 'minitest/autorun'
