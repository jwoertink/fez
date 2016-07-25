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
      "layout.slang"=> "src/views/layouts",
      "index.slang" => "src/views/site"
    }

    FOLDERS = %w(
      public/stylesheets
      public/javascripts
      public/images
      src/views/layouts
      srv/views/site
    )

  end
end
