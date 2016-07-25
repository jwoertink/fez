module Fez
  class Template
    FILES = {
      ".env"        => ".",
      ".gitignore"  => ".",
      ".travis.yml" => ".",
      "app.cr"      => ".",
      "README.md"   => ".",
      "shard.yml"   => ".",
      "robots.txt"  => "public",
      "favicon.ico" => "public",
      "layout.slang"=> "src/views/layouts"
    }

    FOLDERS = %w(
      public/stylesheets
      public/javascripts
      public/images
      src/views/layouts
    )

  end
end
