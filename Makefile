CXXFLAGS := -std=c++20 -Wall -Wextra -Wpedantic -O0 -g
SRC_DIR := src
BIN_DIR := bin

COMMAND := $(firstword $(MAKECMDGOALS))
EXERCISE := $(word 2,$(MAKECMDGOALS))

ifneq ($(filter run build,$(COMMAND)),)
ifneq ($(EXERCISE),)
.PHONY: $(EXERCISE)
$(EXERCISE):
	@:
endif
endif

.PHONY: help run build list clean

help:
	@echo "Usage:"
	@echo "  make run 1-01"
	@echo "  make build 1-01"
	@echo "  make list"
	@echo "  make clean"

build:
	@test -n "$(EXERCISE)" || { \
		echo "Usage: make build <exercise>"; exit 1; \
	}
	@$(MAKE) --no-print-directory $(BIN_DIR)/$(EXERCISE)

run: build
	@./$(BIN_DIR)/$(EXERCISE)

$(BIN_DIR)/%: $(SRC_DIR)/%.c | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BIN_DIR):
	@mkdir -p $@

list:
	@for file in $(SRC_DIR)/*.c:w; do \
		[ -f "$$file" ] || continue; \
		basename "$$file" .c; \
	done

clean:
	rm -rf $(BIN_DIR)

