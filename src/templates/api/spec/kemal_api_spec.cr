require "./spec_helper"

describe "v1 test" do
  it "returns some json" do
    get "/v1/test.json"
    response.body.should eq({"it" => "works"}.to_json)
  end
end
