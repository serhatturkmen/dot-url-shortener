require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

require './router'
require './models/url'

class App < Sinatra::Base
  configure do
    set :root,  File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, 'app', 'views') }
  end

  register Sinatra::ActiveRecordExtension
end
