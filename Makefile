PIO ?= $(HOME)/.platformio/penv/bin/pio

.PHONY: update.bin
update.bin:
	"$(PIO)" run -e default
	@echo .pio/build/default/firmware.bin
