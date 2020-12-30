RSpec.describe Wettr do
  it "has a version number" do
    expect(Wettr::VERSION).not_to be nil
  end

  it "has an api key" do
    expect(ENV["API_KEY"]).not_to be nil
  end
end
