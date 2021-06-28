all: install

# install ruby and crystal dependencies
install:
	shards install
	bundle install

# Compiles scripts and styles
assets:
	sass --update src/assets/styles:public/stylesheets --style compressed
	mkdir -p public/javascripts
	touch public/javascripts/application.js
	ruby es2js.rb

# Compile assets then run app
run: assets
	crystal app.cr

# Boot local console with app pre-loaded
console:
	@icr -r ./config
