require "./spec_helper"
require "../src/fez/application"

describe Fez::Application do
  describe ".build_directory" do
    Spec.before_each do
      Dir.mkdir_p("/tmp/sample_app")
    end

    Spec.after_each do
      FileUtils.rm_r("/tmp/sample_app")
    end

    it "raises an error when the directory exists" do
      expect_raises(Exception) do
        app = Fez::Application.new("sample_app")
        app.build_directory("/tmp")
      end
    end

    it "creates a new directory in /tmp/sample_app/site" do
      app = Fez::Application.new("site")
      app.build_directory("/tmp/sample_site")
      Dir.exists?("/tmp/sample_site").should eq true
      FileUtils.rm_r("/tmp/sample_site")
    end
  end
end
