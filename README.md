# pascal-stack

**500-block pure Pascal replacement for CUDA GPU computation stack: device, memory, kernel, execution, sync, numerical, matrix, tensor, and optimizer layers.**

`pascal-stack` is a Pascal-first systems project for reconstructing a GPU-computation stack from explicit building blocks. Device discovery, memory ownership, kernel representation, execution scheduling, synchronization, numerical primitives, matrices, tensors, and optimization are separable layers — not hidden behind a runtime.

> Build the computation stack from the bottom up.

The current backend is a CPU simulation. Kernels run as serial loops and device memory is allocated from host memory. It does not run on a GPU. The OpenCL, Vulkan, and Metal backends are placeholders that return unsupported errors.

## Table of Contents

- [Requirements](#requirements)
- [Build and Run](#build-and-run)
- [Source Layout](#source-layout)
- [What You Will Build](#what-you-will-build)
- [Limitations](#limitations)
- [Testing](#testing)
- [License](#license)

## Requirements

- Free Pascal 3.2 or newer

No CUDA toolkit or GPU is required.

## Build and Run

From the repository root:

```sh
fpc cmd/pascal-gpu-stack.lpr \
  -Fu./src/core \
  -Fu./src/memory \
  -Fu./src/device \
  -Fu./src/kernel \
  -Fu./src/execution \
  -Fu./src/sync \
  -Fu./src/numerical \
  -Fu./src/matrix \
  -Fu./src/advanced \
  -Fu./src/tests \
  -Fu./src/integration \
  -O2
```

Run:

```sh
./cmd/pascal-gpu-stack
```

On Windows:

```powershell
.\cmd\pascal-gpu-stack.exe
```

The program initializes the simulated backend, prints a compatibility report, runs an integration check, and runs the test suite. Exit code `0` means success.

## Source Layout

| Path | Contents |
| --- | --- |
| `cmd/` | Command-line program |
| `src/core/` | Scalar types, dimensions, errors, utilities |
| `src/memory/` | Host-backed device memory and allocators |
| `src/device/` | Device API and backend interfaces |
| `src/kernel/` | Kernel types, parameters, and dispatch |
| `src/execution/` | Streams, queues, events, scheduling |
| `src/sync/` | Synchronization and atomics |
| `src/numerical/` | Numerical functions and reductions |
| `src/matrix/` | Matrix and tensor operations |
| `src/advanced/` | Higher-level compute and ML operations |
| `src/tests/` | Test runner and test cases |
| `src/integration/` | Public initialization and integration API |
| `build/` | Free Pascal package files |

Source is organized into numbered blocks. Block labels are navigation markers within Pascal units — not separate packages.

## What You Will Build

- **Device** — identity, capabilities, limits, discovery
- **Context** — ownership and lifetime
- **Memory** — allocation, bounds, alignment, transfer, copy/fill/mapping
- **Kernel** — source, metadata, arguments, launch, work dimensions/groups
- **Execution** — queue, command model, submission, state
- **Synchronization** — events, barriers, fences
- **Numerical** — scalars, vectors, reductions
- **Matrix / Tensor** — shape, strides, views, broadcasting, ops
- **Optimizer** — SGD, Momentum, Adam, state and training step
- **Backend** — reference, emulation, and accelerator boundary

Each block has an explicit interface, invariant, and failure condition. Higher layers consume lower-layer contracts without changing semantics.



## License

See [LICENSE](LICENSE).
