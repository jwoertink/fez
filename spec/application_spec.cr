require "spec"
require "../src/fez/application"

describe Fez::Application do
  
  describe ".build_directory" do
    Spec.before_each do
      Dir.mkdir_p("/tmp/sample_app")
    end
    Spec.after_each do
      Dir.rmdir("/tmp/sample_app")
    end
    it "raises an error when the directory exists" do
      expect_raises(Exception) do
        app = Fez::Application.new("sample_app")
        app.build_directory("/tmp")
      end
    end
  end
end
