require "./spec_helper"

describe "root path" do
  it "loads the home page" do
    get "/"
    response.body.should match(/Welcome/i)
  end
end
