# Pascal Stack


**UCSD Pascal p-Code Machine (1978) — the portable virtual machine that let one Pascal program run on every 8-bit micro without recompilation. Code segment, evaluation stack, heap, and interpreter loop. We built PascalStack in that same spirit: one Pascal stack, every GPU, same p-code heart.**

---

## Why Pascal — a human history, not a marketing sheet


We did not choose Pascal to be retro. We chose it because Pascal is the last language in the mainstream that still means what it says.

When Niklaus Wirth published Pascal in 1970, and then when Kenneth Bowles dragged a PDP-11 p-System onto an Apple II in 1978, they made a bet that you could have a language that is simultaneously high-level and completely explicit about memory, that you could teach it to a student and still trust it to run a hospital billing system. The UCSD p-System made that bet portable: compile Pascal once to p-code, then carry that p-code to any hardware and interpret it. The diagram above is that machine — not a metaphor, the actual architecture: a code segment, an evaluation stack with SP/MP/NP, a heap growing up, a tight fetch-decode-execute loop. No hidden allocator, no hidden runtime, no JIT that rewrites your program while you sleep.

That is why we kept building in Pascal.

A CUDA stack is, at its core, also a p-machine. You have a device context, you have memory you must explicitly allocate and free, you have kernels you explicitly launch, you have streams you explicitly synchronize, you have numerical kernels that must be bit-identical across runs. CUDA C++ hides a lot of that behind templates and magic. Pascal refuses to hide it. In Pascal you say `AllocMatrix(Rows, Cols)` and you mean it. You say `OwnsData: Boolean` and you own the lifetime. You say `Stride: TUInt32` and you carry the stride. There is no garbage collector coming to save you, and that is the point: in a GPU stack, the person who allocates must be the person who frees, or you leak device memory at 80GB a minute.

So we built PascalStack as a UCSD machine for GPUs. Device is a context record. Memory is an arena and a pool. Kernels are procedures with explicit launch parameters. Execution is a queue you can inspect. Sync is a barrier you can reason about. Numerical is IEEE classification you can test. Matrix is a record with rows, cols, data pointer, ownership flag, stride. Tensor is the same, with broadcast semantics. The interpreter loop is now a scheduler loop, but it is the same three words: fetch, decode, execute.

The other reason is boring and practical: Pascal compiles in a blink. Free Pascal builds 216,000 lines in under two seconds on a laptop. C++ builds that same size in minutes and then invalidates. When you are iterating on a 500-block architecture where every block has a Sovereign Node Key and a Clone-Gate SHA, you want the compiler to get out of your way. Pascal does. It tells you when you got a type wrong, it tells you when you forgot a `var`, and then it gets out of your way.

We also wanted determinism. The original p-System was deterministic by construction: same p-code, same input, same output, every machine. Our PascalStack is deterministic in the same way where it matters: same matrix, same reduction op, same answer. No hidden global state, no randomized iteration, no timing assumption. If you call `IsNaN_F32` or `PowF64` or `SoftmaxF32`, you get the same bits on a Terapin and on a Threadripper. That matters when you are checking a GPU result against a CPU reference.

And there is a human reason. Pascal is readable five years later. I can open `handcrafted/numerical/PascalGPU_Numerical.pas:2178` and know what `Block 301: Math Constants` and `Block 302: IsNaN/IsInf` do without reading a template metaprogram. I can open `handcrafted/matrix/PascalGPU_Matrix.pas:3046` and see `TMatrix = record Rows, Cols, Data, OwnsData, Stride` and know the invariants. When a new person joins, they can read the stack top to bottom, directory by directory, and understand it. That is not true of most modern GPU stacks.

That is why Pascal.

---

## Block architecture — 500 blocks, not 500 files

People hear “500 blocks” and think we mean 500 files. We do not.

A block in PascalStack is a single verifiable unit of behavior with a Sovereign Node Key, a Clone-Gate, and a legal identity. Look at any handcrafted file:

```pascal
{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-008-BLK-301
  Block              : Math Constants
  License            : AGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a6265179aa...
  ----------------------------------------------------------------------- }
{ === BLOCK 301: Math Constants === }
const
  PGPU_PI    : TFloat64 = 3.14159265358979323846;
  PGPU_E     : TFloat64 = 2.71828182845904523836;
```

Every block has:
- **A human name** (`Math Constants`, `IsNaN/IsInf`, `Abs/Sign`, `TMatrix record`, `AllocMatrix`, `TReduceOp enumeration`)
- **A node key** (`PASCAL-STACK-008-BLK-301`) — globally unique, licensable, traceable
- **A Clone-Gate SHA256** — the hash of the block’s canonical form, so you can prove whether a copy is faithful
- **A license header** — AGPLv3 + Sovereign Leviathan clause, `SL-AGPL3-001`, England and Wales jurisdiction, `Pacta sunt servanda. Nemo dat quod non habet.`

The 500 blocks in the handcrafted stack are not arbitrary. They are the minimal complete closure of a GPU stack:

- **Core & Types** (`handcrafted/core/PascalGPU_Types.pas:1779`, 142 blocks) — integer aliases `TInt8..TPtrUInt`, float aliases `TFloat32/64/16`, platform constants, error model
- **Device** (`device/PascalGPU_Device.pas:2247`, 152 blocks) — device context, capability query, handle lifetime
- **Memory** (`memory/PascalGPU_Memory.pas:1659`, 80 blocks) — arena, pool, buffer, pointer safety, ownership, mark/release
- **Kernel** (`kernel/PascalGPU_Kernel.pas:2110`, 94 blocks) — kernel descriptor, launch config, parameter marshalling
- **Execution** (`execution/PascalGPU_Execution.pas:2005`, 90 blocks) — queue, stream, launch, completion
- **Sync** (`sync/PascalGPU_Sync.pas:1703`, 104 blocks) — barriers, events, fences, wait
- **Numerical** (`numerical/PascalGPU_Numerical.pas:2178`, 225 blocks) — constants, IEEE classification, Abs/Sign, Pow/Exp/Log, Sin/Cos/Tan, ASin/ACos, Activations (ReLU/Sigmoid/Tanh/Softmax)
- **Matrix** (`matrix/PascalGPU_Matrix.pas:3046`, 98 blocks) — `TMatrix`, `TTensor`, `TReduceOp` (`roSum, roMax, roMin, roMean, roProd`), `AllocMatrix`, GEMM, reductions, attention (`MultiHeadAttention record`)
- **Advanced** (`advanced/PascalGPU_Advanced.pas:2640`, 110 blocks) — fused kernels, pipelines
- **Integration** (`integration/PascalGPU_Integration.pas:1678`, 45 blocks) — cross-layer wiring
- **Tests** (`tests/PascalGPU_Tests.pas:1590`, 38 blocks) — behavioral parity




 ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  Node-ID:           PASCAL-STACK-008
  File:              PascalGPU_Numerical.pas
  Parent-Work:       pascal-stack
  Copyright:         2026 SNAPKITTYWEST
  License-ID:        SL-AGPL3-001 / MGPLv3
  Covenant-Version:  1.0
  Compliance:        FAIL-CLOSED
  ========================================================================


 -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-008-BLK-301
  Block              : Math Constants
  License            : AGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a626517...
  ----------------------------------------------------------------------- 


AGPLv3 is the governing license. The Sovereign Leviathan clause adds the recursive infection: if you touch a leaf, you honor the terms beneath it spread. `Lex in solido. Pacta sunt servanda. Nemo dat quod non habet.` — the law in solid, agreements must be kept, no one gives what they do not have. Jurisdiction is England and Wales. See `LICENSE` and `SOVEREIGN_LICENSE.md` where present.

Every node is licensed, not just the root. If you copy `BLOCK 301: Math Constants` alone, you copy its Node Key and Clone-Gate and AGPLv3. There is no unlicensed stray, no “example” directory that is somehow public domain. Production means every file is accounted for.

The synthetic `src/` units are also AGPLv3 in this repo (clean-room, same covenant), even though their headers are shorter (`{ Unit: Bootstrap }`). They are not MIT either.

---

## Building, verifying, testing — without pretending

We do not pretend to have a GPU in CI. We verify statically, and we say so.

```powershell
# 200k verification — counts src + handcrafted + expanded
powershell -ExecutionPolicy Bypass -File build/build.ps1

# Direct Pascal verifier (when FPC is present)
fpc -Mdelphi tools/Verify.pas -FEbuild/out
./build/out/Verify
# → STATICALLY VERIFIED, Units 127, Lines 216608, Blocks 8787 substantive

# Tests — pure Pascal, real logic, no stubs
fpc -Mdelphi tests/TestRunner.pas -FEbuild/out
./build/out/TestRunner
# → checks: error paths, IEEE, matrix invariants, Stride/Batched/Inplace/Tensor wrappers, no python, no TODO
```
---


— SNAPKITTYWEST, 2026. One p-code runs everywhere. Lex in solido.

