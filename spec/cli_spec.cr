require "./spec_helper"
spec_source "errors", "default_options", "cli"

describe Fez::CLI do
  describe ".build_project" do
    
    it "raises a NameError when the name is invalid" do
      expect_raises Fez::Errors::NameError, "You must specify an application name that begins with a letter. View the help menu for more info." do
        cli = Fez::CLI.new("123")
        cli.build_project
      end
    end
  end
end
