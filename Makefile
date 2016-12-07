OUT_DIR=bin

all: build

build:
	@echo "Building Fez in $(shell pwd)"
	@mkdir -p $(OUT_DIR)
	@crystal build --release -o $(OUT_DIR)/fez src/fez.cr

run:
	$(OUT_DIR)/fez

clean:
	rm -rf  $(OUT_DIR) .crystal .shards libs lib
