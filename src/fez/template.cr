module Fez
  class Template
    DEFAULT_FILES = {
      ".env"  => ".",
      ".gitignore" => ".",
      ".travis.yml" => ".",
      "app.cr" => ".",
      "config.cr" => ".",
      "Capfile" => ".",
      "Gemfile" => ".",
      "Guardfile" => ".",
      "Makefile" => ".",
      "README.md" => ".",
      "shard.yml" => ".",
      "deploy.rb" => "config",
      "production.rb" => "config/deploy",
      "helper.cr" => "src/macros",
      "spec_helper.cr" => "spec"
    }

    DEFAULT_FOLDERS = %w(
      bin
      config/deploy
      src/macros
      src/handlers
      spec
    )

    def self.project_files
      if Fez::DefaultOptions.api?
        extra_files = {} of String => String
      else
        extra_files = {
          "es2js.rb" => ".",
          "robots.txt" => "public",
          "favicon.ico" => "public",
          "site.scss" => "src/assets/styles",
          "site.es6" => "src/assets/scripts",
          "manifest.yml" => "src/assets/scripts"
        }
      end

      DEFAULT_FILES.merge(extra_files)
    end

    def self.project_folders
      if Fez::DefaultOptions.api?
        extra_folders = [] of String
      else
        extra_folders = %w(
          public/stylesheets
          public/javascripts
          public/images
          src/views/layouts
          src/views/site
          src/assets/styles
          src/assets/scripts
        )
      end

      DEFAULT_FOLDERS + extra_folders
    end

    def self.default_app_code
      if Fez::DefaultOptions.api?
        script = <<-CODE
        api("v1") do
          # /v1/test.json
          get "/test" do |env|
            {"it" => "works"}.to_json
          end
        end
        CODE
      else
        script = <<-CODE
        get "/" do |env|
          view("site/index")
        end
        CODE
      end

      script
    end
  
    def self.default_spec_code
      if Fez::DefaultOptions.api?
        script = <<-CODE
        require "./spec_helper"

        describe "v1 test" do
          it "returns some json" do
            get "/v1/test.json"
            response.body.should eq {"it" => "works"}.to_json
          end
        end
        CODE
      else
        script = <<-CODE
        require "./spec_helper"

        describe "root path" do
          it "loads the home page" do
            get "/"
            response.body.should match(/Welcome/i)
          end
        end
        CODE
      end

      script
    end
  end
end
