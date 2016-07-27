require "./spec_helper"

describe "<%= name %>.cr" do
  start

  it "loads the home page" do
    get "/"
    response.body.should match(/Welcome/i)
  end
end
