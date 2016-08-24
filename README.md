# fez

Fez is a [Kemal](http://kemalcr.com/) application generator.

Setting up a Kemal app is super simple, but if the app you're building is a little more than "super simple", there's a bit of things you'll end up doing each time you start a project. Why not have a mini generator that will do it for you?

This initial version is going to make some heavy assumptions about the type of app you're building, and the organization of where things will go. Eventually it'll be nice to flesh that out, and make it configurable or something...

* This app will have views
* Views will use [Slang](https://github.com/jeromegn/slang)
* Stylesheets will be [Sass](http://sass-lang.com/)
* Javascript will use ES6 compiled from [Babel](https://babeljs.io/)


## Installation

Since this is an application generator, there's no need to include it as a dependency, or shard. Just install it locally, and build the executable.

```text
$ git clone git@github.com:jwoertink/fez.git
$ cd fez/
$ make
```
You should now have a `bin/fez` file to run.

Optionally, you can use [homebrew](http://brew.sh) to install.

```text
brew tap jwoertink/fez
brew install fez
```

## Usage
You can use `fez -h` for help or `fez -v` to check the version you're running.

Take your `bin/fez` file, and move that to a better location. Preferably somewhere globally accessible like `/usr/local/bin`? 

```text
$ fez -b your_app_name_goes_here
$ fez -b super_cool_app -d ~/Sites/
```

## Development

TODO: (in no particular order)

- [x] Generate basic project structure
- [x] Get a sample app to boot
- [x] Compile sass to css
- [x] Compile es6 to js
- [x] Generate sample spec for making a call to the home page
- [ ] Configuration for using less over sass
- [ ] Configuration for using coffeescript over es6
- [ ] Configuration for defaulting back to ecr instead of slang
- [ ] Use a crystal implementation for stylesheet compilation
- [ ] Use a crystal implementation for javascript compilation
- [x] Add in auto-reload for development

### Generated structure

```text
public/
  | stylesheets/
  | javascripts/
  | images/
  | favicon.ico
  | robots.txt
spec/
  | spec_helper.cr
  | app_name_spec.cr
src/
  | assets/
  | | styles/
  | | scripts/
  | macros/
  | | helper.cr
  | views/
  | | layouts/
  | | | layout.slang
  | | site/
  | | | index.slang
  | app_name.cr
.env
.gitignore
.travis.yml
Gemfile
Guardfile
Makefile
README.md
app.cr
es2js.rb
shard.yml
```

## Philosophy

I would like this to be an easy way to knock out a bunch of kemal apps without having to go through and setup the same things over and over.

I don't want this to become a "framework" wrapper around kemal (even though my apps will most likely do that anyway). If you're looking for a full MVC framework, check out something like [Amethyst](https://github.com/Codcore/amethyst) or [Kemalyst](https://github.com/drujensen/kemalyst).

## Contributing

1. Fork it ( https://github.com/jwoertink/fez/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[jwoertink](https://github.com/jwoertink)] Jeremy Woertink - creator, maintainer
