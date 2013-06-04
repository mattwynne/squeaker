ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'rack/test'
require 'nokogiri'

class SqueakerWorld
  def app
    ActionController::Dispatcher.new
  end
  
  def last_xml
    Nokogiri.parse(last_response.body)
  end
end

World { SqueakerWorld.new }

World(Rack::Test::Methods)