
.PHONY: all
all:

.PHONY: shar
shar:
	./tools/mk-guest-tools-shar

.PHONY: clean
clean:
	rm -rf build
	rm -rf centos-guest-tools-for-smartos-*.sh

