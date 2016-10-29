build:
	crystal build --release src/prism.cr
	tsc

run:
	./prism

serve:
	./server

socket:
	crystal build --release tools/server.cr

setup:
	sudo npm install typings -g
	sudo typings install github:photonstorm/phaser/typescript/typings.json -GD

	shards install
