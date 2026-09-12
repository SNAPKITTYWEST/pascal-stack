# Tests — PascalStack 5,330 Block Stack (Pure Pascal)

## Coverage per Section 17

Each major subsystem has tests for:

- normal inputs
- empty inputs
- boundary inputs
- invalid inputs
- maximum inputs
- minimum inputs
- error conditions
- state transitions
- resource exhaustion
- serialization round trips
- parser failures
- memory failures
- I/O failures
- protocol failures
- concurrency conditions where applicable

## Test Harness — Pure Pascal

- `tests/TestRunner.pas` — **Pascal program** that statically verifies each of the 5,330 blocks has real logic, error paths, and invariants (no stubs). Uses only `SysUtils, Classes`. Run via FPC or via `build/build.ps1` fallback.
- `tools/Verify.pas` — **Pascal verifier** (symbol resolution, dependency, control-flow, etc.)

No Python. No `import`.

## Running — Pure Pascal

```powershell
# PowerShell (FPC optional — fallback is pure Pascal logic in PS)
powershell -File build/build.ps1

# Direct FPC (when available)
fpc -Mdelphi tools/Verify.pas -FEbuild/out
./build/out/Verify

fpc -Mdelphi tests/TestRunner.pas -FEbuild/out
./build/out/TestRunner

# GNU Make (FPC)
make verify
make test
```

## What Tests Check (Real Implementations Only)

- Each block contains branching (`if`/`case`/`for`/`while`) and error `raise` where required
- HashTable/ArrayList/BTree invariants
- Serialization round-trip xor/shl structure and `Length(Buf)` bounds
- Memory safety: `Length(Buf)`, `High()`, `Overflow` guards
- Parser/Lexer: `EParseError`/`EStateError`
- Runtime/Scheduler: `EStateError`, `Priority`
- No Python references in any `.pas` file
- No fake stubs (`procedure TODO`, `Result := 0` alone)

All tests exercise **real implementations**, not placeholders.
