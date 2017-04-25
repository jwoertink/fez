api("v1") do
  # /v1/test.json
  get "/test" do |env|
    {"it" => "works"}.to_json
  end
end