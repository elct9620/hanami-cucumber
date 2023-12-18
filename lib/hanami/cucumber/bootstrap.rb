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
        require_relative "support/capybara" if capybara?
      end

      def from_cucumber?
        caller.detect { |f| f.include? "/env.rb:" }
      end

      def capybara?
        Gem.loaded_specs.include?("capybara")
      end
    end
  end
end
