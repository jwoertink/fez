require "./spec_helper"
spec_source "view_loader"

describe Fez::ViewLoader do
  Spec.before_each do
    Fez::DefaultOptions.application_name = "RICKY BOBBY"
  end
  describe ".layout" do
    it "returns slang code when engine is slang" do
      loader = Fez::ViewLoader.new
      loader.layout.should eq <<-SLANG
      doctype html
      html
        head
          title RICKY BOBBY
          meta charset="utf-8"
          meta http-equiv="X-UA-Compatible" content="IE=edge"
          meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
          meta name="mobile-web-app-capable" content="yes"
          meta name="apple-mobile-web-app-capable" content="yes"
          meta name="apple-mobile-web-app-status-bar-style" content="black"
          link rel="stylesheet" type="text/css" href="/stylesheets/site.css"
        
        body
          == content
          script type="text/javascript" href="/javascripts/site.js"
      SLANG
    end
  end

  describe ".view" do
    it "returns slang code when engine is slang" do
      loader = Fez::ViewLoader.new
      loader.view.should eq "h1 Welcome"
    end
  end
end
