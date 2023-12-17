# frozen_string_literal: true

require "capybara"
require "capybara/cucumber"
require "capybara/session"

Capybara.app = Hanami.app
