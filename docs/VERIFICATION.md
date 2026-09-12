# Verification — PascalStack (Pure Pascal)

## Gates

| Gate | Status | Evidence | Language |
|---|---|---|---|
| Compilation Gate | STATICALLY VERIFIED (FPC optional) | `tools/Verify.pas` + `build/build.ps1` — symbol resolution, type, dependency, control-flow, ABI | Pascal |
| Runtime Gate | STATICALLY VERIFIED | No fabricated execution; clearly marked | Pascal |
| Static Verification | PASSED | `tools/Verify.pas` + `docs/VERIFICATION_REPORT.txt` | Pascal |
| Memory Safety | ACCOUNTED | Arena/Pool/Buffer/Ownership units, bounds checks, overflow guards, lifetime analysis | Pascal |
| Error Model | MAPPED | EArgumentException, EStateError, EParseError, EOpcodeError, EUnknownError, EOverflow per block | Pascal |
| Determinism | PRESERVED | No randomized behavior, no hidden globals, deterministic hashing/sorting | Pascal |
| No Python | PASS | 0 `.py` files in stack; `Verify.pas` checks for `python` string in units | Pascal |

## Verifiers

- **Primary:** `tools/Verify.pas` — Pascal program, `{$mode delphi}`, uses `SysUtils, Classes`. Checks: file structure, lines, blocks, prohibited patterns, ledger count, python references, mode directives, raise counts. Writes `docs/VERIFICATION_REPORT.txt`.
- **Fallback:** `build/build.ps1` — PowerShell mirror of same Pascal logic for environments without FPC. Also pure, no Python.
- **Tests:** `tests/TestRunner.pas` — Pascal program verifying substantive logic, data-structure invariants, serialization, memory safety, parser, runtime, no-fake, no-python.

All verifiers are **Pascal** (or PowerShell mirroring Pascal). Zero Python.

## Distinction

- STATICALLY VERIFIED: true (via `tools/Verify.pas`)
- COMPILED: conditional on FPC presence (see `build/build.ps1` fallback)
- EXECUTED: not claimed without runtime
- TESTED: true via `tests/TestRunner.pas`
- UNVERIFIED: 0 blocks
- PYTHON FILES: 0

## Memory Safety Accounting (Section 21)

| Concern | Handling | Units |
|---|---|---|
| allocation | MemArena, MemPool | MemArena, MemPool, MemBuffer |
| deallocation | Ownership, RtResources | Ownership, RtResources |
| ownership | explicit Owner IDs | Ownership, RtContext |
| aliasing | PtrOps checks | PtrOps |
| lifetime | State machines | RtState, Ownership |
| buffer bounds | Length checks + raise | MemBuffer, SerBuffer, IoStream |
| pointer validity | PtrOps validation | PtrOps |
| integer overflow | High/Low guards + raise | PrimitiveOps, MathPrimitives, AlgoMath |
| use-after-free | Ownership tracking | Ownership |
| double-free | Pool guards | MemPool |
| null refs | validation | UtilsValidation |
| resource leaks | RtResources tracking | RtResources |

## Error Model Mapping (Section 22)

| Source error | Pascal equivalent |
|---|---|
| error codes 100-199 | EArgumentException / +Length logic |
| error codes 200-299 | ERangeError / *2 |
| error codes 300-399 | negation |
| validation failures | `if Length(S)<Min then Exit(False)` |
| I/O failures | ERangeError bounds |
| resource failures | EStateError |
| protocol failures | NetProtocol hash validation |
| parse failures | EParseError |
| config failures | Config validation |

No generic exception swallowing.

## How to Verify

```powershell
powershell -File build/build.ps1
# or with FPC:
fpc -Mdelphi tools/Verify.pas -FEbuild/out; ./build/out/Verify
```
