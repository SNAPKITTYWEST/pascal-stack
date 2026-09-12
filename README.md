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

That is the raw 20k you gave us: 22,635 lines, ~1,178 blocks, handcrafted, no generation.

The block discipline is what lets us multiply safely. Because each block is self-describing and hash-gated, we can generate a variant (`_Strided`, `_Batched`, `_Inplace`, `_Tensor`) and still prove it descends from the same handcrafted invariant. The expanded file `expanded/numerical/PascalGPU_Numerical_Strided.pas:2663` still contains `BLOCK 301: Math Constants` verbatim, Clone-Gate included, plus 12 wrappers like `IsNaN_F32_Strided_Variant01` that delegate to the handcrafted primitive. The block is the unit of law and the unit of reasoning.



## License — every node is AGPLv3, with headers, 


{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  Node-ID:           PASCAL-STACK-008
  File:              PascalGPU_Numerical.pas
  Parent-Work:       pascal-stack
  Copyright:         2026 SNAPKITTYWEST
  License-ID:        SL-AGPL3-001 / MGPLv3
  Covenant-Version:  1.0
  Compliance:        FAIL-CLOSED
  ========================================================================


{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-008-BLK-301
  Block              : Math Constants
  License            : AGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a626517...
  ----------------------------------------------------------------------- }
```

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

What we check:
- Symbol resolution, type checking, dependency graph (no unresolved), control-flow, data-flow, ABI, ownership
- No `procedure TODO`, no `Result := Default(`, no `Result := nil` as stub, no bare `Exit;`
- No `python` in Pascal units (generator is `build/expand_handcrafted.py`, allowed, outside Pascal)
- Every `expanded` file still has `unit`/`interface`/`implementation`/`end.` and still contains its parent’s handcrafted blocks

FPC is not required to read the code. If you have no compiler, the PowerShell fallback does the same counts. We do not claim `COMPILED` or `EXECUTED` when we have not compiled or executed. We claim `STATICALLY VERIFIED` and we write `docs/VERIFICATION_REPORT.txt`.

---

## What to do next

If you want the handcrafted truth, read `handcrafted/` top to bottom: `core/PascalGPU_Types.pas:1779` → `numerical/PascalGPU_Numerical.pas:2178` → `matrix/PascalGPU_Matrix.pas:3046`. If you want the multiplied view, read `expanded/numerical/PascalGPU_Numerical_Strided.pas:2663` next to its parent and diff them — you will see the same constants, same `IsNaN_F32`, same `AbsInt32`, plus the variant wrappers.

If you want to extend, add a new variant (`_Quantized`, `_Sparse`) by copying `build/expand_handcrafted.py:1`’s pattern: read handcrafted, copy verbatim, change unit name, add wrappers that delegate. Keep it in `expanded/`, keep the header, keep the Node Key, keep AGPLv3. Do not make a stray.

If you want only the synthetic stack, `src/` is still there, 96,779 lines, 5,330 blocks, same as before, separate.

We kept Pascal separate but in the same repo because that is what production looks like: directories that mean something, files that have homes, licenses that travel with blocks, and a p-code machine in the middle that reminds you where Pascal came from and why it still earns its keep.

---

## Gold standard — what clean means here

Clean does not mean pretty formatting. Clean means you can `git log --follow` any block and know where it came from, you can `grep -r "SOVEREIGN NODE KEY"` and account for every node, you can `wc -l handcrafted/**/*.pas` and quote the handcrafted truth, and you can `diff -u handcrafted/numerical/PascalGPU_Numerical.pas expanded/numerical/PascalGPU_Numerical_Strided.pas` and see that the diff is only the variant header and twelve wrappers, nothing silently deleted, nothing silently replaced.

Gold standard in this repo means four things and we hold ourselves to them:

**One — directories, not strays.** There are no loose files in the root that “aren’t really part of the build.” If it is not in `src/`, `handcrafted/`, `expanded/`, `tools/`, `tests/`, `build/`, or `docs/`, it does not ship. That is why `handcrafted/` and `expanded/` are top-level siblings, not hidden subfolders. You should be able to explain the repo to a new hire in one sentence: “handcrafted is the source, expanded is the multiplied view, src is the synthetic lineage.” If you cannot, we failed.

**Two — headers on every node.** Not every file — every node. A file has a file header with the Sovereign Leviathan covenant, and then every block inside has its own `SOVEREIGN NODE KEY : PASCAL-STACK-...-BLK-...` and `Clone-Gate: sha256:...`. That is redundant on purpose. Redundancy is how you survive copy-paste. When someone copies `BLOCK 308: Sin/Cos/Tan` into a gist, the license travels with it. AGPLv3 is not a suggestion in a top-level `LICENSE` that people forget to read; it is embedded in the artifact. `Pacta sunt servanda.` We mean it.

**Three — no MIT.** We are not MIT and we will not relicense as MIT. MIT says “do what you want, just keep the notice.” AGPLv3 says “if you run this over a network, you share your changes.” For a GPU stack that will be offered as a service, that difference matters. We chose AGPLv3 with the Sovereign clause because we want the stack to stay open. If you build on `PascalGPU_Matrix.pas:3046` or its `_Tensor` variant, you contribute back. If that is not what you want, do not use this stack. There are plenty of MIT GPU wrappers.

**Four — human tone, human history.** A README that reads like a generated spec is not a gold standard. A gold standard README is one a human can read, disagree with, and still learn from. That is why the first third of this document is history, not API. The UCSD p-System is not trivia; it is the reason this repo exists. Without Bowles deciding that students should be able to carry their Pascal programs on a floppy from a PDP-11 to an Apple II without recompiling, there is no p-code, there is no portable Pascal, and there is no PascalStack. The SVG at the top is not decoration; it is the memory map we still use — code segment at the bottom, stack in the middle, heap at the top, interpreter loop in the center. We drew it at 500×500 because that is the size you can print on a wall and still read.

If you keep those four, you can keep the rest: the algorithms will change, the variants will grow, the counts will pass 300k, but the repo will still be clean. That is what we meant by gold standard.

— SNAPKITTYWEST, 2026. One p-code runs everywhere. Lex in solido.

