module Fez
  class Template
    FILES = %w(
      .env 
      .gitignore
      .travis.yml
      README.md
      shard.yml 
    )

    #{% for name, index in FILES %}
    #  

    #{% end %}

    #macro def_to_s(filename)
    #  def to_s(__io__)
    #    ECR.embed {{filename}}, "__io__"
    #  end
    #end

  end
end
