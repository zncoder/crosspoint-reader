PIO ?= $(HOME)/.platformio/penv/bin/pio
UPSTREAM ?= https://github.com/crosspoint-reader/crosspoint-reader.git

.PHONY: update.bin sync.upstream sync.dev
update.bin:
	"$(PIO)" run -e default
	@echo .pio/build/default/firmware.bin

sync.upstream:
	@if [ "$$(git branch --show-current)" = develop ]; then \
		git pull --ff-only "$(UPSTREAM)" develop; \
	else \
		git fetch "$(UPSTREAM)" develop:develop; \
	fi

sync.dev:
	git rebase develop
