# view macro lets you specify the view to be displayed
#   view("site/index") #=> renders src/views/site/index.slang with the src/views/layouts/layout.slang
#   view("site/_form") => renders src/views/site/_form.slang with no layout
# This can be used in a view, or in a route block
macro view(path)
  {% if path.split("/").last.starts_with?('_') %}
    render "#{__DIR__}/views/#{{{path}}}.slang"
  {% else %}
    render "#{__DIR__}/views/#{{{path}}}.slang", "#{__DIR__}/views/layouts/layout.slang"
  {% end %}
end
