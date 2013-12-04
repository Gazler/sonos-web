require "sonos/presenters/base"

module Sonos
  module Presenter
    def self.const_missing(const)
      Base
    end
  end
end
