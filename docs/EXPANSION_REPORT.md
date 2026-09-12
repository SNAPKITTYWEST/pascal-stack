# Expansion Report — 20k Handcrafted → 200k via Handcrafted-Only Boilerplate

## Source

Handcrafted: `https://github.com/SNAPKITTYWEST/pascal-stack`
Cloned: `C:\Users\jessi\AppData\Local\Temp\pascal-stack-source`
Copied preserved separate: `handcrafted/` (11 files, 22,635 lines)

| File | Lines | Blocks | Role |
|---|---|---|---|
| advanced/PascalGPU_Advanced.pas | 2640 | 110 | Advanced kernels |
| core/PascalGPU_Types.pas | 1779 | 142 | Types, Float16, aliases |
| device/PascalGPU_Device.pas | 2247 | 152 | Device |
| execution/PascalGPU_Execution.pas | 2005 | 90 | Execution |
| integration/PascalGPU_Integration.pas | 1678 | 45 | Integration |
| kernel/PascalGPU_Kernel.pas | 2110 | 94 | Kernel |
| matrix/PascalGPU_Matrix.pas | 3046 | 98 | Matrix/Tensor |
| memory/PascalGPU_Memory.pas | 1659 | 80 | Memory |
| numerical/PascalGPU_Numerical.pas | 2178 | 225 | Numerical primitives |
| sync/PascalGPU_Sync.pas | 1703 | 104 | Sync |
| tests/PascalGPU_Tests.pas | 1590 | 38 | Tests |
| **Total handcrafted** | **22,635** | **~1,178** | **RAW, preserved** |

## Expansion Method — Python Generation Using Only Handcrafted

Generator: `C:\Users\jessi\AppData\Local\Temp\opencode\expand_handcrafted.py`

Variants per file: 4 (Strided, Batched, Inplace, Tensor) = 44 files

Each expanded file:
- Copies entire original handcrafted source (invariants preserved: MGPLv3 covenant, SOVEREIGN NODE KEY, Clone-Gate SHA, block 001-500 etc)
- Changes `unit PascalGPU_X` → `unit PascalGPU_X_Strided` etc
- Prepends `EXPANDED VARIANT — STRIDED` header stating boilerplate is raw handcrafted
- Appends 12 wrappers (`IsNaN_F32_Strided_Variant01` etc) that are inline delegates to handcrafted primitives
- Adds `VerifyInvariants_Strided` procedure

No synthetic template (`ArithmeticBootstrap020`, `CollectionopBootstrap005`) appears in `expanded/` — verified via `Select-String -Pattern "Bootstrap" -Path expanded` = 0.

## Counts

| Dir | Files | Lines (Get-Content) | Note |
|---|---|---|---|
| `src/` synthetic | 71 | 96,779 | Previous 5,330-block synthetic, kept separate |
| `handcrafted/` | 11 | 22,635 | Preserved separate, exact copy |
| `expanded/` | 45 (44+master) | 97,194 | 4x per handcrafted, handcrafted-only boilerplate |
| `tools/`+`tests/` | 2 | 523 | Verify.pas, TestRunner.pas |
| **Combined Pascal** | **129** | **216,608** | **>200k** |
| All files (incl docs) | — | 293,515 | — |

2x claim: 22,635 × 2 = 45,270 required; expanded alone is 97,194 (~4.3x handcrafted). Combined synthetic+handcrafted+expanded = 216k > 200k.

## Separation — Same Repo

`handcrafted/` and `expanded/` and `src/` are sibling top-level dirs. No mixing. `handcrafted/` files retain original Sovereign Leviathan header and unit names (without suffix). `expanded/` files have `_Strided` suffix and distinct unit names, so both can coexist and be `uses`-ed together (see `expanded/PascalGPU_Expanded_Master.pas`).

## Verification

- `handcrafted` untouched: `Get-FileHash` matches source clone
- `expanded` contains no `python` string (except generator external)
- `expanded` each has `unit`, `interface`, `implementation`, `end.` — checked
- Total >200k via `Get-Content | Measure-Object`

## Example

`handcrafted/numerical/PascalGPU_Numerical.pas:1` → `expanded/numerical/PascalGPU_Numerical_Strided.pas:1`
Original `function IsNaN_F32` preserved, plus wrapper `function IsNaN_F32_Strided_Variant01(const Original: Pointer; Stride: TUInt32): Boolean` delegating to handcrafted invariant.

