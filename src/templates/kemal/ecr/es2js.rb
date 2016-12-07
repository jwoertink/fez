require "yaml"                                                                                     
require "babel-transpiler"

manifest = YAML.load_file("src/assets/scripts/manifest.yml")
sources = []
manifest["files"].each do |filename|
  source = File.read("src/assets/scripts/#{filename}")
  if File.extname(filename) == ".es6"
    source = Babel::Transpiler.transform(source, {'compact' => true, 'comments' => false})["code"]
  end
  sources << source
end
File.write("public/javascripts/application.js", sources.join("\n"))

