require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/battleships.rb')

run Battleships

map "/public" do
  run Rack::Directory.new("./public")
end
