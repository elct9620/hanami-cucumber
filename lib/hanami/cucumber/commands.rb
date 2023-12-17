# frozen_string_literal: true

module Hanami
  module Cucumber
    # @since 0.1.0
    # @api private
    module Commands
      class Install < Hanami::CLI::Command
        # @since 0.1.0
        # @api private
        def call(*, **)
          copy_configuration
        end

        private

        def copy_configuration
          fs.cp(
            fs.expand_path(fs.join("generators", "cucumber.yml"), __dir__),
            fs.expand_path(fs.join("config", "cucumber.yml"))
          )
        end
      end
    end
  end
end
