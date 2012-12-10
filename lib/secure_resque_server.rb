# encoding: UTF-8

require 'resque/server'

class SecureResqueServer < Resque::Server
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['asdf', 'asdf123'] # change username / pw if you want to
  end
end