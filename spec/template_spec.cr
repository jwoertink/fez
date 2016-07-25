require "./spec_helper"
require "../src/fez/template"

describe Fez::Template do
  describe "FILES" do
    it "is an array with some top level filenames" do
      Fez::Template::FILES.should be_a Array(String)
    end
  end
end
