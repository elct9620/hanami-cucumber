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
          append_gemfile
          copy_env
          copy_configuration
        end

        private

        def append_gemfile
          fs.append(
            fs.expand_path("Gemfile"),
            fs.read(fs.expand_path(fs.join("generators", "gemfile"), __dir__))
          )
        end

        def copy_env
          fs.cp(
            fs.expand_path(fs.join("generators", "env.rb"), __dir__),
            fs.expand_path(fs.join("features", "support", "env.rb"))
          )
        end

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
