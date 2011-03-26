require 'rack'
require 'rack/lobster'
require './shrimp.rb'

use Shrimp
run Rack::Lobster.new

#run by using rackup rack.ru