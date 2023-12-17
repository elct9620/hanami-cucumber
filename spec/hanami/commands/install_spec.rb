# frozen_string_literal: true

require "tmpdir"

RSpec.describe Hanami::Cucumber::Commands::Install do
  subject(:install) { described_class.new(fs: fs) }

  let(:fs) { Dry::Files.new }
  let(:dir) { Dir.mktmpdir }
  let(:app) { "synth" }
  let(:app_name) { "Synth" }

  let(:arbitrary_argument) { {} }

  before { install.call(arbitrary_argument) }

  around do |example|
    Dir.chdir(dir) { example.run }
  ensure
    fs.delete_directory(dir)
  end

  describe "append to Gemfile" do
    subject { fs.read("Gemfile") }

    it "is expected to add depend gems" do
      is_expected.to include <<~RUBY
        group :test do
          gem "rack-test"

          gem "capybara"
          gem "selenium-webdriver"
        end
      RUBY
    end
  end

  describe "copy config/cucumber.yml" do
    subject { fs.read("config/cucumber.yml") }

    it "is expected to contains cucumber profile" do
      is_expected.to include <<~'YAML'
        <%
        rerun = File.file?('rerun.txt') ? IO.read('rerun.txt') : ""
        rerun = rerun.strip.gsub /\s/, ' '
        rerun_opts = rerun.empty? ? "--format #{ENV['CUCUMBER_FORMAT'] || 'progress'} features" : "--format #{ENV['CUCUMBER_FORMAT'] || 'pretty'} #{rerun}"
        std_opts = "--format #{ENV['CUCUMBER_FORMAT'] || 'pretty'} --strict --tags 'not @wip'"
        %>
        default: <%= std_opts %> features
        wip: --tags @wip:3 --wip features
        rerun: <%= rerun_opts %> --format rerun --out rerun.txt --strict --tags 'not @wip'
      YAML
    end
  end

  describe "copy features/support/env.rb" do
    subject { fs.read("features/support/env.rb") }

    it "is expected to require Hanami::Cucumber" do
      is_expected.to include <<~RUBY
        require "hanami/cucumber"
      RUBY
    end
  end
end
