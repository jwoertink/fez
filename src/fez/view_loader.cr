module Fez
  class ViewLoader
    
    def initialize
      @engine = Fez::DefaultOptions.template_engine.as(String)
      @application_name = Fez::DefaultOptions.application_name.as(String)
    end

    def generate(directory)
      path = File.join(directory, "src", "views")
            
      File.write(File.join(path, "layout/layout.#{@engine}"), layout)
      File.write(File.join(path, "site/index.#{@engine}"), view)
    end

    def layout
      code = <<-CODE
      <!doctype html>
      <html>
        <head>
          <title>#{@application_name}</title>
          <meta charset="utf-8"/>
          <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
          <meta name="mobile-web-app-capable" content="yes"/>
          <meta name="apple-mobile-web-app-capable" content="yes"/>
          <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
          <link rel="stylesheet" type="text/css" href="/stylesheets/site.css"/>
        </head>
        <body>
          == content
          <script type="text/javascript" href="/javascripts/site.js"></script>
        </body>
      </html>
      CODE
      code = convert_to_slang(code) if @engine == "slang"
      code
    end

    def view
      code = <<-CODE
      <h1>Welcome</h1>
      CODE
      code = convert_to_slang(code) if @engine == "slang"
      code
    end

    private def convert_to_slang(code)
      code = code.gsub(/<\/\w+>/, "") # remove closing tags
      code.match(/(>|\/>)(\w)/)
      code = code.gsub(/(>|\/>)\w/, " #{$2}") # remove end of tags, and give some space
      code = code.gsub(/>|\/>/, "") # remove remaining end of tags
      code = code.gsub(/<!|</, "") # remove start of tags
      code.chomp.strip
    end
  end
end
