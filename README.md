# Pascal GPU Stack

Pascal GPU Stack is a Free Pascal implementation of common GPU programming concepts. It provides APIs for device memory, kernel dispatch, synchronization, numerical operations, matrices, tensors, and several machine-learning operations.

The current backend is a CPU simulation. Kernels run as serial loops and device memory is allocated from host memory. It does not run code on a GPU. The OpenCL, Vulkan, and Metal backends are placeholders that return unsupported errors.

## Requirements

- Free Pascal 3.2 or newer

No CUDA toolkit or GPU is required.

## Build and run

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

Run the program:

```sh
./cmd/pascal-gpu-stack
```

On Windows:

```powershell
.\cmd\pascal-gpu-stack.exe
```

The program initializes the simulated backend, prints a compatibility report, runs an integration check, and runs the test suite. A result of `0` means success.

## Source layout

| Path | Contents |
| --- | --- |
| `cmd/` | Command-line program |
| `src/core/` | Scalar types, dimensions, errors, and utilities |
| `src/memory/` | Host-backed device memory and allocators |
| `src/device/` | Device API and backend interfaces |
| `src/kernel/` | Kernel types, parameters, and dispatch |
| `src/execution/` | Streams, queues, events, and scheduling |
| `src/sync/` | Synchronization and atomic operations |
| `src/numerical/` | Numerical functions and reductions |
| `src/matrix/` | Matrix and tensor operations |
| `src/advanced/` | Higher-level compute and ML operations |
| `src/tests/` | Test runner and test cases |
| `src/integration/` | Public initialization and integration API |
| `build/` | Free Pascal package files |

The source is organized into numbered blocks. The block labels are navigation markers within the Pascal units; they are not separate packages or executables.

## Limitations

- Execution is serial on the host CPU.
- Memory transfers copy between host allocations; there is no hardware DMA.
- Streams do not provide concurrent GPU execution.
- Hardware-specific warp operations are not implemented.
- The non-simulated device backends are not implemented.

## License

See [LICENSE](LICENSE).
