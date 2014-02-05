#
# Copyright (c) 2013, Joyent, Inc. All rights reserved.
#
#


VERSION := $(shell grep '%define version' me-centos.spec | awk '{print $$3}')
# Intentionally relying on info in .ssh/config.
PUBLISH_HOST := download
PUBLISH_RDIR := /shared/download/pub/guest-tools
PUBLISH_LOC := $(PUBLISH_HOST):$(PUBLISH_RDIR)

.PHONY: all
all:

.PHONY: shar
shar:
	./tools/mk-guest-tools-shar

.PHONY: publish
publish:
	ssh $(PUBLISH_HOST) mkdir -p $(PUBLISH_RDIR)
	scp `ls centos-guest-tools-for-smartos-$(VERSION)-*.sh | tail -1` \
		$(PUBLISH_LOC)/centos-guest-tools-for-smartos-$(VERSION).sh

# Ensure all version-carrying files have the same version.
.PHONY: versioncheck
versioncheck:
	[[ $(VERSION) == `grep '^## ' CHANGES.md | head -1 | awk '{print $$2}'` ]]
	@echo Version check ok.

.PHONY: check
check: versioncheck

.PHONY: clean
clean:
	rm -rf build
	rm -rf centos-guest-tools-for-smartos-*.sh

