# fez

Fez is an application generator for projects with [Kemal](http://kemalcr.com/). If you're looking for larger projects, check out [KGen](https://github.com/TechMagister/kemalyst-generator).

Setting up a Kemal app is super simple, but if the app you're building is a little more than "super simple", there's a bit of things you'll end up doing each time you start a project. Why not have a mini generator that will do it for you?

This generator will generate a somewhat opinionated version of:

* Simple app with assets and views (customizable between ECR and Slang) setup
* Simple API with api versioning
* Simple app backed by a database (coming soon)

## Installation

Since this is an application generator, there's no need to include it as a dependency, or shard. Just install it locally, and build the executable.

```text
$ git clone git@github.com:jwoertink/fez.git
$ cd fez/
$ make
```
You should now have a `bin/fez` file to run. You can symlink this to a more global location like `/usr/local/bin` to make it easier to use.

Optionally, you can use [homebrew](http://brew.sh) to install. 

```text
brew tap jwoertink/fez
brew install fez
```

**NOTE** If you have issues running from homebrew, install from github, and report the error to [homebrew-fez](https://github.com/jwoertink/homebrew-fez)

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

$ fez my_cool_app --directory=~/Projects/myapp.cr
```

If you don't specify a directory, fez will assume you want to use the current directory you're in.

### Templates

Fez comes out of the box with several different templates:
* Kemal with slang
* Kemal with ECR
* Kemal as an API
* more coming later...

By default, fez uses Kemal with [Slang](https://github.com/jeromegn/slang) as the default template. If you would like to switch back to using Crystal's built in ECR, or build an api, you will use the `--template` or `-t` flag. This flag is optional.

```text
$ fez my_cool_app -t ecr

or

$ fez my_cool_app --template=ecr
```

### Generating an API only application

If you're building an API, and don't need HTML, CSS and JavaScript, you can use Fez to generate an API only app.

```text
$ fez my_api -t api
```

By default a JSON API will be generated with route versioning. You can read up on [kave](https://github.com/jwoertink/kave) for more info about api customization.

### Other Frameworks

Previously fez supported generating [kemalyst](https://github.com/drujensen/kemalyst) apps. Now that the framework is gaining more traction, they have started a new generator called [KGen](https://github.com/TechMagister/kemalyst-generator) which you can use for those projects.


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

Now that you have a handle on developing your app, you will want to deploy it! There's a lot of different methods to deploying an app in to production, and fez takes the [Capistrano](http://capistranorb.com/) appraoch.

1. Edit your `config/deploy.rb` file with the necessary changes.
2. Edit your `config/deploy/production.rb` file with more necessary changes
3. Run `cap production deploy`. 
4. Pray it all works!

Alternitively, if you're looking to deploy to [Heroku](https://www.heroku.com/), you can use [Crystal Heroku Build Pack](https://github.com/crystal-lang/heroku-buildpack-crystal/) to deploy.

## Development

If you'd like to help contribute, check out the Projects tab, or issues.


## Contributing

1. Fork it ( https://github.com/jwoertink/fez/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jwoertink](https://github.com/jwoertink) Jeremy Woertink - creator, maintainer
- [Other Brave Souls](https://github.com/jwoertink/fez/graphs/contributors)

