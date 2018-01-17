all: intel armv7

intel: deploydir
	cargo build --release
	mv target/release/test-for-pi deploy/test-for-pi-intel


armv7: deploydir
	docker run -it --rm -v ${PWD}:/work rustcross/armv7-unknown-linux-gnueabihf:latest cargo build --release --target armv7-unknown-linux-gnueabihf
	sudo mv target/armv7-unknown-linux-gnueabihf/release/test-for-pi deploy/test-for-pi-armv7
	sudo chown `id -u`:`id -g` deploy/test-for-pi-armv7

deploydir:
	sudo modprobe vcan
	sudo ip link add dev vcan0 type vcan
	sudo ip link set up vcan0
	mkdir -p deploy

clean:
	cargo clean
	rm -rf target
	rm -rf deploy
