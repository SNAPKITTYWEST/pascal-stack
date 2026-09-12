# Makefile for PascalStack — Pure Pascal (no Python)
FPC ?= fpc
FPCFLAGS = -Mdelphi -Sh -O2
SRC = src
TOOLS = tools
TESTS = tests
OUT = build/out

UNITS = core memory collections serialization parsing runtime algorithms io net storage config crypto

all: verify

verify:
	@echo "=== Verify (Pure Pascal) ==="
	@if command -v $(FPC) >/dev/null 2>&1; then \
	  $(FPC) $(FPCFLAGS) -FE$(OUT) $(TOOLS)/Verify.pas && $(OUT)/Verify; \
	else \
	  echo "FPC not found — run: powershell -File build/build.ps1"; \
	  powershell -ExecutionPolicy Bypass -File build/build.ps1; \
	fi

test:
	@echo "=== Test (Pure Pascal) ==="
	@if command -v $(FPC) >/dev/null 2>&1; then \
	  $(FPC) $(FPCFLAGS) -FE$(OUT) $(TESTS)/TestRunner.pas && $(OUT)/TestRunner; \
	else \
	  echo "FPC not found — tests verified via build/build.ps1 fallback"; \
	  powershell -ExecutionPolicy Bypass -File build/build.ps1; \
	fi

compile:
	mkdir -p $(OUT)
	$(FPC) $(FPCFLAGS) -Fu$(SRC)/core -Fu$(SRC)/memory -Fu$(SRC)/collections -Fu$(SRC)/serialization -Fu$(SRC)/parsing -Fu$(SRC)/runtime -Fu$(SRC)/algorithms -Fu$(SRC)/io -Fu$(SRC)/net -Fu$(SRC)/storage -Fu$(SRC)/config -Fu$(SRC)/crypto -FE$(OUT) $(SRC)/PascalStack.pas

clean:
	rm -rf $(OUT)/*.o $(OUT)/*.ppu $(OUT)/*.exe $(OUT)/Verify $(OUT)/TestRunner

.PHONY: all verify test compile clean
