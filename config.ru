require 'rubygems'
require 'bundler'

Bundler.require

require './app'

use Rack::Rewrite do
  r301 %r{.*}, 'http://www.stopmophoto.com$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != 'www.stopmophoto.com'
  }
end

run StopMotionPhoto::Www