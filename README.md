# Pascal Stack


**UCSD Pascal p-Code Machine (1978) — the portable virtual machine that let one Pascal program run on every 8-bit micro without recompilation. Code segment, evaluation stack, heap, and interpreter loop. We built PascalStack in that same spirit: one Pascal stack, every GPU, same p-code heart.**

---

## Why Pascal — a human history, not a marketing sheet


We did not choose Pascal to be retro. We chose it because Pascal is the last language in the mainstream that still means what it says.

When Niklaus Wirth published Pascal in 1970, and then when Kenneth Bowles dragged a PDP-11 p-System onto an Apple II in 1978, they made a bet that you could have a language that is simultaneously high-level and completely explicit about memory, that you could teach it to a student and still trust it to run a hospital billing system. The UCSD p-System made that bet portable: compile Pascal once to p-code, then carry that p-code to any hardware and interpret it. The diagram above is that machine — not a metaphor, the actual architecture: a code segment, an evaluation stack with SP/MP/NP, a heap growing up, a tight fetch-decode-execute loop. No hidden allocator, no hidden runtime, no JIT that rewrites your program while you sleep.

That is why we kept building in Pascal.

## Block architecture — 500 blocks, not 500 files

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



 -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-008-BLK-301
  Block              : Math Constants
  License            : AGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a626517...
  ----------------------------------------------------------------------- 


AGPLv3 is the governing license. The Sovereign Leviathan clause adds the recursive infection: if you touch a leaf, you honor the terms beneath it spread. `Lex in solido. Pacta sunt servanda. Nemo dat quod non habet.` — the law in solid, agreements must be kept, no one gives what they do not have. Jurisdiction is England and Wales. See `LICENSE` and `SOVEREIGN_LICENSE.md` where present.

Every node is licensed, not just the root. If you copy `BLOCK 301: Math Constants` alone, you copy its Node Key and Clone-Gate and AGPLv3. There is no unlicensed stray, no “example” directory that is somehow public domain. Production means every file is accounted for.




— SNAPKITTYWEST, 2026.

