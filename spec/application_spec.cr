require "./spec_helper"
spec_source "application"

TMP_SAMPLE_DIR = "/tmp/sample_site"
TMP_SAMPLE_APP = "/tmp/sample_app"

describe Fez::Application do
  describe ".build_directory" do
    Spec.before_each do
      Dir.mkdir_p(TMP_SAMPLE_APP)
    end

    Spec.after_each do
      FileUtils.rm_r(TMP_SAMPLE_APP)
      FileUtils.rm_r(TMP_SAMPLE_DIR) if Dir.exists?(TMP_SAMPLE_DIR)
    end

    it "raises an error when the directory exists" do
      expect_raises(Exception) do
        app = Fez::Application.new("sample_app")
        app.build_directory("/tmp")
      end
    end

    it "creates a new directory in /tmp/sample_app/site" do
      app = Fez::Application.new("site")
      app.build_directory(TMP_SAMPLE_DIR)
      Dir.exists?(TMP_SAMPLE_DIR).should eq true
    end

    it "creates an empty .env file on project's root directory" do
      app = Fez::Application.new("site")
      root_dir_path = TMP_SAMPLE_DIR
      env_path = File.join(root_dir_path, ".env")
      app.build_directory(root_dir_path)
      app.build_project(Fez::DefaultOptions.template.as(String))
      Dir.exists?(TMP_SAMPLE_DIR).should eq true
      File.exists?(env_path).should eq true
    end
  end
end
