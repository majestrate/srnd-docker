

all: run

build:
	docker build -t srnd .
run: build
	mkdir -p data
  docker rm overchan
	docker run --name overchan -v $(PWD)/data:/srnd/root -w /srnd/root srnd /srnd/run.sh
