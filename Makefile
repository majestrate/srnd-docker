

all: run

build:
	docker build -t srnd .

run: build
	docker run --name overchan -v $(PWD)/data:/srnd/root -w /srnd/root srnd /srnd/run.sh

clean:
	docker rm overchan
