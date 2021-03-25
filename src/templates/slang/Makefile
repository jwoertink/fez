all: install

# install ruby and crystal dependencies
install:
	shards install
	bundle install

# Compiles scripts and styles
assets:
	sass --update src/assets/styles:public/stylesheets --style compressed
	ruby es2js.rb

# Compile assets then run app
run: assets
	crystal app.cr

# Boot local console with app pre-loaded
console:
	@icr -r ./config
