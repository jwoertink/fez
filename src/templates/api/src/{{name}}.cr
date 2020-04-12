api("v1") do
  # /v1/test.json
  get "/test" do
    {"it" => "works"}.to_json
  end
end
