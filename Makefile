build:
	crystal build --release src/prism.cr
	tsc

serve:
	./prism

setup:
	sudo npm install typings
	sudo typings install github:photonstorm/phaser/typescript/typings.json -GD
