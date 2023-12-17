# frozen_string_literal: true

RSpec.describe Hanami::Cucumber do
  it "returns version" do
    expect(Hanami::Cucumber::VERSION).to eq("0.1.0")
  end
end
