build:
	mkdir -p bin/
	nasm -f bin -o bin/hello_boot.bin src/hello.asm
	nasm -f bin -o bin/hello_boot_minimal.bin src/hello_minimal.asm

run:
	qemu-system-x86_64 -m 1G -smp 1 \
		-drive file=bin/hello_boot.bin,format=raw

run-minimal:
	qemu-system-x86_64 -m 1G -smp 1 \
		-drive file=bin/hello_boot_minimal.bin,format=raw

clean:
	rm -rf bin/
