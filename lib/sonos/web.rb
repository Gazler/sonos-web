require "sonos"
require "sinatra"
require "json"

require "sinatra/bootstrap"
require "sonos/web/version"
require "sonos/presenter"

module Sonos
  module Web
    class Application < Sinatra::Application
      register Sinatra::Bootstrap::Assets
      get "/" do
        erb :index
      end

      get "/speakers.json" do
        jsonify(system.speakers)
      end

      def jsonify(array)
        array.map { |a| Presenter::Speaker.new(a) }.to_json
      end

      def system
        Sonos::System.new
      end
    end
  end
end
