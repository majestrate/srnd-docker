build:
	docker build -t srnd .
run: build
	mkdir -p data
	docker run -v $PWD/data:/srnd/root -w /srnd/root srnd /srnd/run.sh

all: run
