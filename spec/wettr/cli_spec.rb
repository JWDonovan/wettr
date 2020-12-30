require "spec_helper"
require "wettr/cli"

RSpec.describe Wettr::CLI do
  it "prints the help menu" do
    help_text = <<-HELP_TEXT
    Usage:
      wettr [options]
    \nOptions:
      --help                           # Print this menu
      --version                        # Print the version number
      --zip ZIP_CODE                   # Weather by zip/postal code
    \nDescription:
      wettr is a command line ruby gem to get current weather information
      using OpenWeatherMap's Current Weather API in conjunction with the
      ipapi.co IP address api.
    \n  wettr can get current weather data using either a zip/postal code
      or an IP address. Simply type wettr to get started.
    \nExamples:
      wettr                            # Weather by current IP address location
      wettr --zip 10001                # Weather by zip/postal code for New York City
      wettr --zip 20001                # Weather by zip/postal code for Washington D.C.
    HELP_TEXT

    expect{ Wettr::CLI.new.print_help_menu }.to output(help_text).to_stdout
  end

  it "has an args attr_reader" do
    expect(Wettr::CLI.new).respond_to?(:args)
  end

  it "doesn't have an args attr_accessor" do
    expect(Wettr::CLI.new).not_to respond_to("args=")
  end

  it "has nil args if not set in initialize" do
    expect(Wettr::CLI.new.args).to be_nil
  end
end