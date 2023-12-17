# frozen_string_literal: true

require "hanami/cli"
require "zeitwerk"

# @see Hanami::Cucumber
# @since 0.1.0
module Hanami
  # Cucumber and testing support for Hanami applications
  #
  # @since 0.1.0
  # @api private
  module Cucumber
    # @since 0.1.0
    # @api private
    def self.gem_loader
      @gem_loader ||= Zeitwerk::Loader.new.tap do |loader|
        root = File.expand_path("..", __dir__)
        loader.tag = "hanami-cucumber"
        loader.inflector = Zeitwerk::GemInflector.new("#{root}/hanami-cucumber.rb")
        loader.push_dir(root)
        loader.ignore(
          "#{root}/hanami-cucumber.rb",
          "#{root}/hanami/cucumber/{rake_tasks,version}.rb",
          "#{root}/hanami/cucumber/support"
        )
        loader.inflector.inflect("cucumber" => "Cucumber")
      end
    end

    gem_loader.setup
    require_relative "cucumber/version"
    require_relative "cucumber/rake_tasks"

    if Hanami::CLI.within_hanami_app?
      Hanami::CLI.after "install", Commands::Install
    end

    Bootstrap.boot
  end
end
