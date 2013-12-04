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

      get "/speakers" do
        jsonify(system.speakers)
      end

      get "/playlist/:id" do
        speaker = system.speakers.find { |sp| sp.uid == params[:id] }
        speaker.queue.to_json
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
