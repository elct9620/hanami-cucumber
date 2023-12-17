# frozen_string_literal: true

module Hanami
  module Cucumber
    # @since 0.1.0
    # @api private
    module Bootstrap
      module_function

      # @since 0.1.0
      # @api private
      def boot
        return unless from_cucumber?

        ENV["HANAMI_ENV"] ||= "test"
        require "hanami/prepare"
        require_relative "support/world"
      end

      def from_cucumber?
        caller.detect { |f| f.include? "/env.rb:" }
      end
    end
  end
end
