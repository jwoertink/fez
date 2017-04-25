all: install

# install ruby and crystal dependencies
install:
	shards install
	bundle install
  
# Compiles scripts and styles
assets:
# Compile assets then run app
run: assets
	crystal app.cr

# Boot local console with app pre-loaded
console:
	@icr -r ./config
