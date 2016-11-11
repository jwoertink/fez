module Fez
  class Template
    FILES = [
      {"name" => ".env",            "path" => ".",                  "web" => true, "api" => true},
      {"name" => ".gitignore",      "path" => ".",                  "web" => true, "api" => true},
      {"name" => ".travis.yml",     "path" => ".",                  "web" => true, "api" => true},
      {"name" => "app.cr",          "path" => ".",                  "web" => true, "api" => true},
      {"name" => "config.cr",       "path" => ".",                  "web" => true, "api" => true},
      {"name" => "Capfile",         "path" => ".",                  "web" => true, "api" => true},
      {"name" => "Gemfile",         "path" => ".",                  "web" => true, "api" => true},
      {"name" => "Guardfile",       "path" => ".",                  "web" => true, "api" => true},
      {"name" => "Makefile",        "path" => ".",                  "web" => true, "api" => true},
      {"name" => "README.md",       "path" => ".",                  "web" => true, "api" => true},
      {"name" => "shard.yml",       "path" => ".",                  "web" => true, "api" => true},
      {"name" => "deploy.rb",       "path" => "config",             "web" => true, "api" => true},
      {"name" => "production.rb",   "path" => "config/deploy",      "web" => true, "api" => true},
      {"name" => "helper.cr",       "path" => "src/macros",         "web" => true, "api" => true},
      {"name" => "spec_helper.cr",  "path" => "spec",               "web" => true, "api" => true},
      {"name" => "es2js.rb",        "path" => ".",                  "web" => true, "api" => false},
      {"name" => "robots.txt",      "path" => "public",             "web" => true, "api" => false},
      {"name" => "favicon.ico",     "path" => "public",             "web" => true, "api" => false},
      {"name" => "site.scss",       "path" => "src/assets/styles",  "web" => true, "api" => false},
      {"name" => "site.es6",        "path" => "src/assets/scripts", "web" => true, "api" => false},
      {"name" => "manifest.yml",    "path" => "src/assets/scripts", "web" => true, "api" => false}
    ]
    FOLDERS = [
      {"path" => "bin",                 "web" => true, "api" => true},
      {"path" => "config/deploy",       "web" => true, "api" => true},
      {"path" => "src/macros",          "web" => true, "api" => true},
      {"path" => "src/handlers",        "web" => true, "api" => true},
      {"path" => "spec",                "web" => true, "api" => true},
      {"path" => "public/stylesheets",  "web" => true, "api" => false},
      {"path" => "public/javascripts",  "web" => true, "api" => false},
      {"path" => "public/images",       "web" => true, "api" => false},
      {"path" => "src/views/layouts",   "web" => true, "api" => false},
      {"path" => "src/views/site",      "web" => true, "api" => false},
      {"path" => "src/assets/styles",   "web" => true, "api" => false},
      {"path" => "src/assets/scripts",  "web" => true, "api" => false}
    ]

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
