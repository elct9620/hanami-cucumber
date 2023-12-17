# frozen_string_literal: true

require "rack/test"

module Hanami
  module Cucumber
    class World
      include Rack::Test::Methods

      def app
        Hanami.app
      end
    end
  end
end

World do
  Hanami::Cucumber::World.new
end
