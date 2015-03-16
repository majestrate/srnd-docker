build:
	docker build -t SRNd .
run: build
	mkdir -p data
	docker run -v $PWD/data:/srnd/root -w /srnd/root SRNd /srnd/run.sh

all: run
