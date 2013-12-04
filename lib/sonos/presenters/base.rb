module Sonos
  module Presenter
    class Base

      attr_accessor :object

      def initialize(object)
        @object = object
      end

      def to_json(*)
        @object.data.to_json
      end
    end
  end
end
