require "./spec_helper"
spec_source "template"

describe Fez::Template do
  describe "FILES" do
    it "is a hash of filename keys and path values" do
      Fez::Template::FILES.should be_a Array(Hash(String, Bool | String))
    end
  end

  describe "FOLDERS" do
    it "is an array of folder paths" do
      Fez::Template::FOLDERS.should be_a Array(Hash(String, Bool | String))
    end
  end
end
