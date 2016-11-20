# fez

Fez is a [Kemal](http://kemalcr.com/) application generator.

Setting up a Kemal app is super simple, but if the app you're building is a little more than "super simple", there's a bit of things you'll end up doing each time you start a project. Why not have a mini generator that will do it for you?

## Installation

Since this is an application generator, there's no need to include it as a dependency, or shard. Just install it locally, and build the executable.

```text
$ git clone git@github.com:jwoertink/fez.git
$ cd fez/
$ make
```
You should now have a `bin/fez` file to run. You can symlink this to a more global location like `/usr/bin/local` to make it easier to use.

Optionally, you can use [homebrew](http://brew.sh) to install.

```text
brew tap jwoertink/fez
brew install fez
```

## Usage

Using fez is pretty easy. To see a help menu just run `fez -h`. You can see the version of fez you're running with `fez -v`

TL;DR `fez yourappname`

### Naming your app

To set the name of your application, you run fez with the name of the project. This is *required* in order to run. 

This example will generate a `./my_cool_app/` folder.
```text
$ fez my_cool_app
```

### Specifying the directory name

Fez gives you the option to create a different name for the directory your app is in than the actual app name. You can do this with the `--directory` or `-d` flag. This flag is optional.

This example will generate an app called `my_cool_app` in a `myapp.cr` folder.

```text
$ fez my_cool_app -d ~/Projects/myapp.cr 

or

$ fez  my_cool_app --directory=~/Projects/myapp.cr
```

If you don't specify a directory, fez will assume you want to use the current directory you're in.

### Changing the view template

By default, fez uses Kemal with Slang `kemal_slang` as the default template. If you would like to switch back to using Crystal's built in ECR you will use the `--template` or `-t` flag. This flag is optional.

```text
$ fez my_cool_app -t kemal_ecr

or

$ fez -b my_cool_app --template=kemal_ecr
```

### Kemalyst ECR template

dru.jensen has provided a template for [kemalyst](https://github.com/drujensen/kemalyst) if you prefer that framework:
```text
$ fez my_cool_app -t kemalyst_ecr
```

### Generating an API only application

If you're building an API, and don't need HTML, CSS and JavaScript, you can use Fez to generate an API only app.

```text
$ fez my_api -t kemal_api
```

By default a JSON API will be generated with route versioning. You can read up on [kave](https://github.com/jwoertink/kave) for more info about api customization.

### Working with a fez generated app

Now that you've generated your shiny new Kemal app, it's time to start doing development on it. The generated app will contain a `README.md` file that has all the instructions on how to start development.

Your app will have 2 primary dependencies to run. 
* [Ruby](https://www.ruby-lang.org/)
* [Crystal](https://crystal-lang.org/)

If you have those two installed, then your next step is to `cd` in to your new app's directory and run `make install`.

```text
$ cd ~/Projects
Projects $ fez supertrain
Projects $ cd supertrain
Projects/supertrain $ make install
```

Running `make install` will install the shard dependencies for your app (like Kemal, duh!), and then install the ruby gem dependencies. You may be asking yourself _why have ruby gem dependencies?_... Ruby has tools that work great like `guard` and `sass`. Plus, chances are, you came to Crystal from Ruby anyway, and if you're on a Mac, Ruby is installed by default.

Ok, now that your app dependencies are installed, you have 2 options to boot this baby.

1. `make run` - This compiles your assets in to their natural form, and then boots kemal.
2. `guard` - This will boot your kemal and then watch for any changes to the files.

Both of these options will boot a server on `localhost:3001`. The difference is that using guard allows you to do live-reloading.

If you need to use a console (REPL) for development, you can use the `make console` command. You will have access to whatever has been required in your app's `config.cr`

```text
Projects/supertrain $ make console
 => ok
icr(0.19.1) > Kemal
 => Kemal
icr(0.19.1) >
```

Now that you have a handle on developing your Kemal app, you will want to deploy it! There's a lot of different methods to deploying an app in to production, and fez takes the [Capistrano](http://capistranorb.com/) appraoch.

1. Edit your `config/deploy.rb` file with the necessary changes.
2. Edit your `config/deploy/production.rb` file with more necessary changes
3. Run `cap production deploy`. 
4. Pray it all works!

## Development

If you'd like to help contribute, check out the Projects tab, or issues.

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
