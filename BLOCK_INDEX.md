# PascalGPU Stack — Block Index (500 Blocks)

| Block | Unit | Description |
|-------|------|-------------|
| BLOCK 001 | PascalGPU_Types | Core scalar type aliases: TGPUFloat, TGPUDouble, TGPUInt32 |
| BLOCK 002 | PascalGPU_Types | TGPUIndex type definition and range constants |
| BLOCK 003 | PascalGPU_Types | TGPUSize, TGPUOffset, TGPUStride fundamental pointer arithmetic types |
| BLOCK 004 | PascalGPU_Types | TGPUResult enumeration: success, out-of-memory, invalid-arg, timeout |
| BLOCK 005 | PascalGPU_Types | TGPUDimension record: x, y, z word fields with constructors |
| BLOCK 006 | PascalGPU_Types | TGPUGrid record: block-dim and grid-dim nested TGPUDimension |
| BLOCK 007 | PascalGPU_Types | TGPUDataType enumeration: Float16, Float32, Float64, Int8, Int16, Int32, Int64 |
| BLOCK 008 | PascalGPU_Types | TGPUTensorShape dynamic array type and helper ShapeOf function |
| BLOCK 009 | PascalGPU_Types | TGPUHandle opaque pointer alias and NilHandle sentinel constant |
| BLOCK 010 | PascalGPU_Types | TGPUEvent opaque event handle and event-state enumeration |
| BLOCK 011 | PascalGPU_Types | TGPUStream opaque stream handle and default-stream constant |
| BLOCK 012 | PascalGPU_Types | TGPUDeviceID cardinal alias and MaxDevices constant |
| BLOCK 013 | PascalGPU_Types | TGPUMemFlags set type: HostMapped, HostCached, DeviceLocal, Unified |
| BLOCK 014 | PascalGPU_Types | TGPUKernelFlags set type: Inline, NoUnroll, MaxOccupancy, SharedMem |
| BLOCK 015 | PascalGPU_Types | TGPUVersion record: major, minor, patch and ToString method |
| BLOCK 016 | PascalGPU_Types | PascalGPUVersion function returning current library version string |
| BLOCK 017 | PascalGPU_Types | TGPUErrorCode enumeration covering all driver and runtime error codes |
| BLOCK 018 | PascalGPU_Types | TGPUException class: ErrorCode, DeviceID, message, stack-trace fields |
| BLOCK 019 | PascalGPU_Types | GPURaiseOnError procedure: converts TGPUResult to TGPUException |
| BLOCK 020 | PascalGPU_Types | TGPUCallback procedure-of-object type for async completion hooks |
| BLOCK 021 | PascalGPU_Types | TGPUProgressCallback function type returning Boolean for cancellation |
| BLOCK 022 | PascalGPU_Types | TGPULogLevel enumeration: Debug, Info, Warning, Error, Fatal |
| BLOCK 023 | PascalGPU_Types | TGPULogEntry record: timestamp, level, source-unit, message |
| BLOCK 024 | PascalGPU_Types | TGPULogHandler procedure-of-object type for pluggable logging |
| BLOCK 025 | PascalGPU_Types | TGPUProfilingRecord: kernel-name, elapsed-ns, occupancy, bandwidth |
| BLOCK 026 | PascalGPU_Types | TGPUProfilingList dynamic array and aggregation helpers |
| BLOCK 027 | PascalGPU_Types | TGPUFeatureSet set type: DoublePrecision, AtomicOps, UnifiedMemory, TensorCores |
| BLOCK 028 | PascalGPU_Types | TGPUArchitecture enumeration: Kepler, Maxwell, Pascal, Volta, Turing, Ampere, Hopper |
| BLOCK 029 | PascalGPU_Types | TGPUComputeCapability record: major/minor bytes with Compare function |
| BLOCK 030 | PascalGPU_Types | TGPUPeerAccess record: src/dst device pair and direction flags |
| BLOCK 031 | PascalGPU_Types | TGPUTransferDir enumeration: HostToDevice, DeviceToHost, DeviceToDevice, HostToHost |
| BLOCK 032 | PascalGPU_Types | TGPUBufferDescriptor: size, alignment, flags, preferred-device fields |
| BLOCK 033 | PascalGPU_Types | TGPUKernelDescriptor: name, module-handle, argument-count fields |
| BLOCK 034 | PascalGPU_Types | TGPUSamplerMode enumeration: Nearest, Linear, Cubic, Anisotropic |
| BLOCK 035 | PascalGPU_Types | TGPUWrapMode enumeration: Clamp, Repeat, Mirror, Border |
| BLOCK 036 | PascalGPU_Types | TGPUTextureDescriptor: width, height, depth, sampler, wrap fields |
| BLOCK 037 | PascalGPU_Types | TGPUSurfaceDescriptor: backing-buffer, mip-levels, format |
| BLOCK 038 | PascalGPU_Types | TGPUGraphNode opaque handle and TGPUGraphNodeType enumeration |
| BLOCK 039 | PascalGPU_Types | TGPUGraph opaque handle and maximum-node-count constant |
| BLOCK 040 | PascalGPU_Types | GPUNullCheck inline function: asserts non-nil handle, raises on failure |
| BLOCK 041 | PascalGPU_Memory | TGPUAllocator abstract base class with Alloc/Free/Realloc virtual methods |
| BLOCK 042 | PascalGPU_Memory | TGPUDefaultAllocator: driver malloc/free delegation with alignment padding |
| BLOCK 043 | PascalGPU_Memory | TGPUPoolAllocator: slab-based pool, configurable slab-size and max-slabs |
| BLOCK 044 | PascalGPU_Memory | TGPUBuddyAllocator: binary-buddy allocator for power-of-two device buffers |
| BLOCK 045 | PascalGPU_Memory | TGPUArenaAllocator: bump-pointer arena with Reset and Checkpoint methods |
| BLOCK 046 | PascalGPU_Memory | GPUMalloc function: device allocation returning typed pointer and size |
| BLOCK 047 | PascalGPU_Memory | GPUFree procedure: safe device-pointer free with nil-guard |
| BLOCK 048 | PascalGPU_Memory | GPUMallocHost function: pinned host allocation with write-combine option |
| BLOCK 049 | PascalGPU_Memory | GPUFreeHost procedure: pinned host memory release |
| BLOCK 050 | PascalGPU_Memory | GPUMallocManaged function: unified memory allocation with migration hints |
| BLOCK 051 | PascalGPU_Memory | GPUMemPrefetch procedure: async prefetch to device or CPU |
| BLOCK 052 | PascalGPU_Memory | GPUMemAdvise procedure: access-pattern hints for unified memory |
| BLOCK 053 | PascalGPU_Memory | GPUMemcpy function: synchronous device-device and host-device copy |
| BLOCK 054 | PascalGPU_Memory | GPUMemcpyAsync function: stream-ordered async copy returning event |
| BLOCK 055 | PascalGPU_Memory | GPUMemset procedure: device memory fill with byte pattern |
| BLOCK 056 | PascalGPU_Memory | GPUMemsetAsync procedure: stream-ordered async memset |
| BLOCK 057 | PascalGPU_Memory | TGPUPinnedBuffer class: RAII wrapper for pinned host memory |
| BLOCK 058 | PascalGPU_Memory | TGPUDeviceBuffer class: RAII wrapper for device memory with typed access |
| BLOCK 059 | PascalGPU_Memory | TGPUManagedBuffer class: RAII unified-memory buffer with sync helpers |
| BLOCK 060 | PascalGPU_Memory | TGPUMemoryPool class: coalescing pool for same-size repeated allocations |
| BLOCK 061 | PascalGPU_Memory | TGPUMemoryStats record: allocated, peak, freed, fragmentation fields |
| BLOCK 062 | PascalGPU_Memory | GPUGetMemoryStats function: per-device allocator statistics snapshot |
| BLOCK 063 | PascalGPU_Memory | GPUResetMemoryStats procedure: zero all counters for a given device |
| BLOCK 064 | PascalGPU_Memory | TGPUMemoryGuard class: canary-boundary overflow detection wrapper |
| BLOCK 065 | PascalGPU_Memory | GPUPointerGetAttributes function: query pointer type, device, host-pointer |
| BLOCK 066 | PascalGPU_Memory | GPUIpcGetMemHandle function: exportable IPC memory handle |
| BLOCK 067 | PascalGPU_Memory | GPUIpcOpenMemHandle function: import cross-process memory handle |
| BLOCK 068 | PascalGPU_Memory | GPUIpcCloseMemHandle procedure: release IPC handle mapping |
| BLOCK 069 | PascalGPU_Memory | TGPUMemoryMap class: virtual-address range mapping for sparse tensors |
| BLOCK 070 | PascalGPU_Memory | GPUVirtualAllocate function: reserve virtual address range |
| BLOCK 071 | PascalGPU_Memory | GPUVirtualFree procedure: release virtual address reservation |
| BLOCK 072 | PascalGPU_Memory | GPUPhysicalAlloc function: allocate physical memory chunk |
| BLOCK 073 | PascalGPU_Memory | GPUVirtualMap procedure: map physical chunk into virtual address |
| BLOCK 074 | PascalGPU_Memory | GPUVirtualUnmap procedure: unmap physical chunk from virtual range |
| BLOCK 075 | PascalGPU_Memory | TGPUSparseBuffer class: lazy-commit sparse buffer for large tensors |
| BLOCK 076 | PascalGPU_Memory | GPUGetFreeMemory function: query device free and total memory bytes |
| BLOCK 077 | PascalGPU_Memory | GPUSetMemoryLimit procedure: enforce per-allocator hard ceiling |
| BLOCK 078 | PascalGPU_Memory | TGPUMemoryEvent enumeration: Alloc, Free, OutOfMemory, Prefetch, Evict |
| BLOCK 079 | PascalGPU_Memory | TGPUMemoryObserver interface: OnMemoryEvent callback registration |
| BLOCK 080 | PascalGPU_Memory | GPURegisterMemoryObserver / GPUUnregisterMemoryObserver helpers |
| BLOCK 081 | PascalGPU_Memory | TGPUMemcpyBatch class: coalesced multi-region copy in single driver call |
| BLOCK 082 | PascalGPU_Memory | TGPUMemcpyBatch.Add procedure: enqueue a (src, dst, bytes) tuple |
| BLOCK 083 | PascalGPU_Memory | TGPUMemcpyBatch.Submit function: execute all queued copies on a stream |
| BLOCK 084 | PascalGPU_Memory | GPUMemcpy2D function: pitched 2-D strided copy |
| BLOCK 085 | PascalGPU_Memory | GPUMemcpy3D function: volumetric strided copy with CUDA_MEMCPY3D params |
| BLOCK 086 | PascalGPU_Memory | TGPUCopyEngine class: dedicated copy-engine stream assignment per device |
| BLOCK 087 | PascalGPU_Memory | GPUEnablePeerAccess / GPUDisablePeerAccess for NVLink/PCIe peer buffers |
| BLOCK 088 | PascalGPU_Memory | GPUCanAccessPeer function: query peer-copy capability between two devices |
| BLOCK 089 | PascalGPU_Memory | TGPUMemoryDump class: hex-dump device memory region to stdout or file |
| BLOCK 090 | PascalGPU_Memory | GPUCheckMemoryIntegrity function: verify canary bytes across all allocations |
| BLOCK 091 | PascalGPU_Device | PascalGPU_Init procedure: driver initialization and device enumeration |
| BLOCK 092 | PascalGPU_Device | PascalGPU_Shutdown procedure: flush all streams, free resources, driver exit |
| BLOCK 093 | PascalGPU_Device | GPUGetDeviceCount function: return number of visible CUDA/OpenCL devices |
| BLOCK 094 | PascalGPU_Device | TGPUDeviceProps record: 40+ fields (name, memory, clocks, warp-size, etc.) |
| BLOCK 095 | PascalGPU_Device | GPUGetDeviceProperties function: populate TGPUDeviceProps for a device ID |
| BLOCK 096 | PascalGPU_Device | GPUSetDevice / GPUGetDevice: set and query current active device |
| BLOCK 097 | PascalGPU_Device | GPUDeviceReset procedure: reset context, free all device-side resources |
| BLOCK 098 | PascalGPU_Device | GPUDeviceSynchronize procedure: block host until all device work completes |
| BLOCK 099 | PascalGPU_Device | TGPUDeviceContext class: RAII context guard (push/pop device on create/destroy) |
| BLOCK 100 | PascalGPU_Device | TGPUMultiDevice class: iterate and dispatch across all available devices |
| BLOCK 101 | PascalGPU_Device | GPUGetComputeCapability function: return TGPUComputeCapability for device |
| BLOCK 102 | PascalGPU_Device | GPUGetArchitecture function: map compute capability to TGPUArchitecture enum |
| BLOCK 103 | PascalGPU_Device | GPUGetFeatureSet function: populate TGPUFeatureSet for device |
| BLOCK 104 | PascalGPU_Device | GPUGetMemoryClock / GPUGetCoreClock: query current clock frequencies |
| BLOCK 105 | PascalGPU_Device | GPUSetClockLimits procedure: set min/max SM and memory clock for perf mode |
| BLOCK 106 | PascalGPU_Device | GPUResetClockLimits procedure: restore driver-default clock frequencies |
| BLOCK 107 | PascalGPU_Device | TGPUThermalInfo record: temperature, throttle-reason, power-draw fields |
| BLOCK 108 | PascalGPU_Device | GPUGetThermalInfo function: live thermal/power snapshot for device |
| BLOCK 109 | PascalGPU_Device | GPUGetPCIeInfo function: bus-ID, link-gen, link-width, throughput |
| BLOCK 110 | PascalGPU_Device | GPUGetNVLinkInfo function: NVLink active lanes, bandwidth, peer count |
| BLOCK 111 | PascalGPU_Device | TGPUDeviceSelector abstract class: pick best device by scoring policy |
| BLOCK 112 | PascalGPU_Device | TGPUMaxMemorySelector: choose device with most free memory |
| BLOCK 113 | PascalGPU_Device | TGPUMaxComputeSelector: choose highest compute-capability device |
| BLOCK 114 | PascalGPU_Device | TGPUMinThermalSelector: choose coolest device for sustained workloads |
| BLOCK 115 | PascalGPU_Device | GPUSelectDevice function: apply TGPUDeviceSelector and return chosen ID |
| BLOCK 116 | PascalGPU_Device | TGPUDeviceGuard class: save/restore active device around a code block |
| BLOCK 117 | PascalGPU_Device | GPUGetDriverVersion / GPURuntimeVersion: version string query functions |
| BLOCK 118 | PascalGPU_Device | PrintCompatibilityReport function: formatted device/driver report string |
| BLOCK 119 | PascalGPU_Device | TGPUDevicePool class: round-robin dispatch to a subset of devices |
| BLOCK 120 | PascalGPU_Device | GPUEnumerateDevices procedure: call user callback for each visible device |
| BLOCK 121 | PascalGPU_Device | TGPUDeviceHealthMonitor class: periodic thermal/error-state poller |
| BLOCK 122 | PascalGPU_Device | GPUSetDeviceFlags procedure: set scheduling flags (Spin, Yield, BlockingSync) |
| BLOCK 123 | PascalGPU_Device | GPUGetDeviceFlags function: query current scheduling flags |
| BLOCK 124 | PascalGPU_Device | GPUSaveDeviceState / GPURestoreDeviceState: checkpoint/restore context |
| BLOCK 125 | PascalGPU_Device | TGPUDeviceEvent enumeration: Added, Removed, Error, Recovered |
| BLOCK 126 | PascalGPU_Device | TGPUDeviceObserver interface: OnDeviceEvent callback contract |
| BLOCK 127 | PascalGPU_Device | GPURegisterDeviceObserver / GPUUnregisterDeviceObserver helpers |
| BLOCK 128 | PascalGPU_Device | GPUDeviceHeartbeat procedure: send NOP kernel to detect hung device |
| BLOCK 129 | PascalGPU_Device | TGPUDeviceMetrics record: utilization-%, memory-%, PCIe-BW, NVLink-BW |
| BLOCK 130 | PascalGPU_Device | GPUCollectMetrics function: sample TGPUDeviceMetrics for one device |
| BLOCK 131 | PascalGPU_Device | TGPUMetricHistory class: rolling window of TGPUDeviceMetrics snapshots |
| BLOCK 132 | PascalGPU_Device | GPUExportMetricsCSV procedure: write metric history to CSV file |
| BLOCK 133 | PascalGPU_Device | GPUSetPersistentMode procedure: keep GPU in P0 state for low-latency |
| BLOCK 134 | PascalGPU_Device | GPUGetECCState function: query ECC enabled/disabled and error counts |
| BLOCK 135 | PascalGPU_Device | GPUResetECCCounts procedure: clear correctable/uncorrectable ECC counters |
| BLOCK 136 | PascalGPU_Kernel | TGPUModule class: load PTX or CUBIN from file or memory |
| BLOCK 137 | PascalGPU_Kernel | TGPUModule.GetFunction: locate kernel by name, return TGPUKernel handle |
| BLOCK 138 | PascalGPU_Kernel | TGPUModule.GetGlobal: locate device global variable by name |
| BLOCK 139 | PascalGPU_Kernel | TGPUModule.Unload: release module and all associated kernels |
| BLOCK 140 | PascalGPU_Kernel | TGPUKernel class: encapsulates function handle + occupancy metadata |
| BLOCK 141 | PascalGPU_Kernel | TGPUKernel.SetAttribute: set shared-mem size, max-threads, cache-config |
| BLOCK 142 | PascalGPU_Kernel | TGPUKernel.GetAttribute: query per-attribute values from driver |
| BLOCK 143 | PascalGPU_Kernel | TGPUKernel.Launch: synchronous single-stream launch with grid/block dims |
| BLOCK 144 | PascalGPU_Kernel | TGPUKernel.LaunchAsync: stream-ordered async launch returning event |
| BLOCK 145 | PascalGPU_Kernel | TGPUKernelArgs class: type-safe argument packing with Add<T> generics |
| BLOCK 146 | PascalGPU_Kernel | TGPUKernelArgs.AddPointer: push device pointer to argument list |
| BLOCK 147 | PascalGPU_Kernel | TGPUKernelArgs.AddScalar: push 4-/8-byte scalar to argument list |
| BLOCK 148 | PascalGPU_Kernel | TGPUKernelArgs.AddSharedMem: declare dynamic shared memory size |
| BLOCK 149 | PascalGPU_Kernel | TGPUKernelArgs.Build: finalise void** array for driver launch API |
| BLOCK 150 | PascalGPU_Kernel | TGPUOccupancyCalculator class: max-blocks-per-SM given resource usage |
| BLOCK 151 | PascalGPU_Kernel | GPUOccupancyMaxPotentialBlockSize: suggest optimal grid/block split |
| BLOCK 152 | PascalGPU_Kernel | GPUOccupancyAvailableDynamicSharedMem: query headroom for dynamic smem |
| BLOCK 153 | PascalGPU_Kernel | TGPUCooperativeKernel class: grid-sync cooperative launch variant |
| BLOCK 154 | PascalGPU_Kernel | GPULaunchCooperativeKernel procedure: multi-device cooperative launch |
| BLOCK 155 | PascalGPU_Kernel | TGPUKernelGraph class: capture kernel launches into a CUDA graph |
| BLOCK 156 | PascalGPU_Kernel | TGPUKernelGraph.BeginCapture / EndCapture: graph-capture scope markers |
| BLOCK 157 | PascalGPU_Kernel | TGPUKernelGraph.Instantiate: compile captured graph to executable |
| BLOCK 158 | PascalGPU_Kernel | TGPUKernelGraph.Launch: launch instantiated graph on a stream |
| BLOCK 159 | PascalGPU_Kernel | TGPUKernelGraph.Update: update node parameters without re-instantiation |
| BLOCK 160 | PascalGPU_Kernel | TGPUJITOptions record: optimisation-level, debug-level, PTX-version |
| BLOCK 161 | PascalGPU_Kernel | GPULoadPTXString: compile PTX source string with JIT options |
| BLOCK 162 | PascalGPU_Kernel | GPULoadCubinFile: load pre-compiled CUBIN with NVVM metadata |
| BLOCK 163 | PascalGPU_Kernel | TGPUKernelCache class: name-keyed module/kernel cache with LRU eviction |
| BLOCK 164 | PascalGPU_Kernel | TGPUKernelProfiler class: per-kernel ns timer using GPU events |
| BLOCK 165 | PascalGPU_Kernel | TGPUSharedMemConfig enumeration: DefaultBankSize, FourByte, EightByte |
| BLOCK 166 | PascalGPU_Kernel | GPUSetSharedMemConfig / GPUGetSharedMemConfig: bank-width control |
| BLOCK 167 | PascalGPU_Kernel | GPUSetCacheConfig: prefer L1 / prefer shared-mem / equal split |
| BLOCK 168 | PascalGPU_Kernel | TGPUDynamicParallelism class: parent-kernel child-launch descriptor |
| BLOCK 169 | PascalGPU_Kernel | GPUKernelNodeParams record: grid, block, sharedMem, kernel, args |
| BLOCK 170 | PascalGPU_Kernel | TGPUGraphKernelNode: add kernel node to a TGPUKernelGraph |
| BLOCK 171 | PascalGPU_Kernel | TGPUGraphMemcpyNode: add async-copy node to a TGPUKernelGraph |
| BLOCK 172 | PascalGPU_Kernel | TGPUGraphMemsetNode: add async-memset node to a TGPUKernelGraph |
| BLOCK 173 | PascalGPU_Kernel | TGPUGraphHostNode: add host-function callback node to a TGPUKernelGraph |
| BLOCK 174 | PascalGPU_Kernel | TGPUGraphEventNode: add event-record or event-wait node to graph |
| BLOCK 175 | PascalGPU_Kernel | GPUGraphAddDependency: add directed dependency edge between graph nodes |
| BLOCK 176 | PascalGPU_Kernel | GPUGraphGetNodes: enumerate all nodes in a TGPUKernelGraph |
| BLOCK 177 | PascalGPU_Kernel | GPUGraphDebugDotPrint: emit GraphViz DOT description of a kernel graph |
| BLOCK 178 | PascalGPU_Kernel | TGPUKernelDispatcher class: worker-pool-based multi-stream launcher |
| BLOCK 179 | PascalGPU_Kernel | TGPUWarpInfo record: warp-size, warps-per-SM, resident-warps |
| BLOCK 180 | PascalGPU_Kernel | GPUGetWarpInfo function: populate TGPUWarpInfo for given kernel |
| BLOCK 181 | PascalGPU_Kernel | TGPURegisterInfo record: registers-per-thread, max-regs-per-block |
| BLOCK 182 | PascalGPU_Kernel | GPUGetRegisterInfo function: query register usage of compiled kernel |
| BLOCK 183 | PascalGPU_Kernel | TGPUSMem record: static-bytes, dynamic-bytes, total-available |
| BLOCK 184 | PascalGPU_Kernel | GPUGetSMemInfo function: query static and dynamic shared-mem usage |
| BLOCK 185 | PascalGPU_Kernel | GPUKernelSetName procedure: annotate kernel with human-readable name |
| BLOCK 186 | PascalGPU_Kernel | TGPUKernelBenchmark class: repeated-launch timing with warmup iterations |
| BLOCK 187 | PascalGPU_Kernel | TGPUKernelBenchmark.Run function: returns mean/stddev/min/max nanoseconds |
| BLOCK 188 | PascalGPU_Kernel | GPURangeProfilePush / GPURangeProfilePop: NVTX range annotation |
| BLOCK 189 | PascalGPU_Kernel | TGPUKernelWatcher class: detect long-running kernels exceeding timeout |
| BLOCK 190 | PascalGPU_Kernel | GPUKernelAbort procedure: attempt async kernel termination on timeout |
| BLOCK 191 | PascalGPU_Execution | TGPUStreamPool class: manage a fixed set of reusable streams |
| BLOCK 192 | PascalGPU_Execution | TGPUStreamPool.Acquire / Release: check-out and return a stream |
| BLOCK 193 | PascalGPU_Execution | GPUStreamCreate / GPUStreamDestroy: low-level stream lifecycle |
| BLOCK 194 | PascalGPU_Execution | GPUStreamSynchronize procedure: block host until stream completes |
| BLOCK 195 | PascalGPU_Execution | GPUStreamWaitEvent procedure: insert stream-side event wait |
| BLOCK 196 | PascalGPU_Execution | GPUStreamAddCallback procedure: host callback on stream completion |
| BLOCK 197 | PascalGPU_Execution | GPUStreamQuery function: non-blocking query of stream completion |
| BLOCK 198 | PascalGPU_Execution | TGPUStreamPriority enumeration: Low, Normal, High and priority range query |
| BLOCK 199 | PascalGPU_Execution | GPUStreamCreateWithPriority: create stream at given TGPUStreamPriority |
| BLOCK 200 | PascalGPU_Execution | TGPUWorkQueue class: producer-consumer kernel queue per stream |
| BLOCK 201 | PascalGPU_Execution | TGPUWorkQueue.Enqueue: add TGPUKernelArgs task to pending list |
| BLOCK 202 | PascalGPU_Execution | TGPUWorkQueue.Flush procedure: submit all pending tasks to stream |
| BLOCK 203 | PascalGPU_Execution | TGPUWorkQueue.Drain function: flush + synchronize, return elapsed ns |
| BLOCK 204 | PascalGPU_Execution | TGPUExecutionPlan class: dependency-sorted multi-kernel plan |
| BLOCK 205 | PascalGPU_Execution | TGPUExecutionPlan.Add: register a kernel with its data dependencies |
| BLOCK 206 | PascalGPU_Execution | TGPUExecutionPlan.Compile: topological sort and stream assignment |
| BLOCK 207 | PascalGPU_Execution | TGPUExecutionPlan.Execute: launch all stages in dependency order |
| BLOCK 208 | PascalGPU_Execution | TGPUExecutionPlan.Reset: clear plan for reuse with new parameters |
| BLOCK 209 | PascalGPU_Execution | TGPURoundRobinScheduler class: distribute work across stream pool |
| BLOCK 210 | PascalGPU_Execution | TGPUPriorityScheduler class: highest-priority task always launched first |
| BLOCK 211 | PascalGPU_Execution | TGPUFairShareScheduler class: weighted fair-share across work queues |
| BLOCK 212 | PascalGPU_Execution | TGPUExecutionContext class: per-task execution environment snapshot |
| BLOCK 213 | PascalGPU_Execution | GPUSetCurrentContext / GPUGetCurrentContext: context stack accessors |
| BLOCK 214 | PascalGPU_Execution | TGPUFuture<T> class: deferred result of async kernel returning T |
| BLOCK 215 | PascalGPU_Execution | TGPUFuture<T>.Get function: block-until-ready and return value |
| BLOCK 216 | PascalGPU_Execution | TGPUFuture<T>.Then: chain callback on completion |
| BLOCK 217 | PascalGPU_Execution | TGPUPromise<T> class: fulfill TGPUFuture<T> from kernel callback |
| BLOCK 218 | PascalGPU_Execution | TGPUAsyncReduce function: async reduction returning TGPUFuture<T> |
| BLOCK 219 | PascalGPU_Execution | TGPUPipeline class: multi-stage pipelined kernel execution with double-buffer |
| BLOCK 220 | PascalGPU_Execution | TGPUPipeline.AddStage: register kernel stage with i/o buffer bindings |
| BLOCK 221 | PascalGPU_Execution | TGPUPipeline.Run: execute pipeline for N input batches |
| BLOCK 222 | PascalGPU_Execution | TGPUPipeline.GetThroughput: compute elements-per-second rate |
| BLOCK 223 | PascalGPU_Execution | TGPUTaskGraph class: CUDA-graph-backed task graph execution engine |
| BLOCK 224 | PascalGPU_Execution | TGPUTaskGraph.Build: create graph from TGPUExecutionPlan |
| BLOCK 225 | PascalGPU_Execution | TGPUTaskGraph.Launch: submit graph for repeated re-execution |
| BLOCK 226 | PascalGPU_Execution | TGPUTaskGraph.UpdateParam: hot-update scalar without re-instantiation |
| BLOCK 227 | PascalGPU_Execution | GPUAbortOnDriverError: global error handler wrapping all driver calls |
| BLOCK 228 | PascalGPU_Execution | TGPURetryPolicy class: configurable retry count and back-off for transient errors |
| BLOCK 229 | PascalGPU_Execution | TGPUExecutionStats record: total-launches, errors, retries, avg-latency-ns |
| BLOCK 230 | PascalGPU_Execution | GPUGetExecutionStats function: snapshot per-stream execution statistics |
| BLOCK 231 | PascalGPU_Execution | GPUResetExecutionStats procedure: zero counters for a stream or device |
| BLOCK 232 | PascalGPU_Execution | TGPULaunchBounds record: min-blocks-per-SM, max-threads-per-block |
| BLOCK 233 | PascalGPU_Execution | GPUSetLaunchBounds procedure: apply bounds annotation to kernel |
| BLOCK 234 | PascalGPU_Execution | TGPUStreamCapture class: begin/end capture helpers with auto-graph creation |
| BLOCK 235 | PascalGPU_Execution | GPUForEachDevice procedure: run callback on each device in order |
| BLOCK 236 | PascalGPU_Execution | TGPUParallelFor class: 1-D parallel-for loop mapped to kernel launch |
| BLOCK 237 | PascalGPU_Execution | TGPUParallelFor.Run: launch, synchronize, return wall-clock milliseconds |
| BLOCK 238 | PascalGPU_Execution | TGPUParallelReduce class: tree-reduction parallel-reduce abstraction |
| BLOCK 239 | PascalGPU_Execution | TGPUParallelScan class: prefix-sum parallel-scan abstraction |
| BLOCK 240 | PascalGPU_Execution | TGPUParallelSort class: radix-sort parallel-sort abstraction |
| BLOCK 241 | PascalGPU_Sync | GPUEventCreate / GPUEventDestroy: low-level event lifecycle functions |
| BLOCK 242 | PascalGPU_Sync | GPUEventRecord: record event timestamp on a stream |
| BLOCK 243 | PascalGPU_Sync | GPUEventSynchronize: block host until event is reached |
| BLOCK 244 | PascalGPU_Sync | GPUEventQuery: non-blocking event completion query |
| BLOCK 245 | PascalGPU_Sync | GPUEventElapsedTime: compute ms between two recorded events |
| BLOCK 246 | PascalGPU_Sync | TGPUScopedEvent class: RAII record-on-create, sync-on-destroy event |
| BLOCK 247 | PascalGPU_Sync | TGPUEventPool class: pre-allocated reusable event pool |
| BLOCK 248 | PascalGPU_Sync | TGPUEventPool.Acquire / Release: check-out and return events |
| BLOCK 249 | PascalGPU_Sync | TGPUBarrier class: host-side barrier for multiple concurrent streams |
| BLOCK 250 | PascalGPU_Sync | TGPUBarrier.Wait procedure: block until all registered streams signal |
| BLOCK 251 | PascalGPU_Sync | TGPUSemaphore class: GPU-side counting semaphore with P/V operations |
| BLOCK 252 | PascalGPU_Sync | TGPUSemaphore.Signal / Wait: increment and decrement counter |
| BLOCK 253 | PascalGPU_Sync | TGPUMutex class: GPU-side ticket-lock mutual exclusion |
| BLOCK 254 | PascalGPU_Sync | TGPUMutex.Lock / Unlock: acquire and release GPU-side lock |
| BLOCK 255 | PascalGPU_Sync | TGPURWLock class: GPU-side readers-writer lock |
| BLOCK 256 | PascalGPU_Sync | TGPURWLock.ReadLock / ReadUnlock / WriteLock / WriteUnlock methods |
| BLOCK 257 | PascalGPU_Sync | TGPUAtomicCounter class: device-side atomic 64-bit counter |
| BLOCK 258 | PascalGPU_Sync | TGPUAtomicCounter.Increment / Decrement / Reset / Read methods |
| BLOCK 259 | PascalGPU_Sync | TGPUFence class: cross-stream ordering fence using events |
| BLOCK 260 | PascalGPU_Sync | TGPUFence.Signal: record fence completion on source stream |
| BLOCK 261 | PascalGPU_Sync | TGPUFence.Wait: insert stream-side wait on fence event |
| BLOCK 262 | PascalGPU_Sync | TGPUMultiDeviceFence class: synchronize across two or more device streams |
| BLOCK 263 | PascalGPU_Sync | GPUSyncAll procedure: synchronize all streams on all visible devices |
| BLOCK 264 | PascalGPU_Sync | TGPUSyncGroup class: coordinate a named subset of streams |
| BLOCK 265 | PascalGPU_Sync | TGPUSyncGroup.Add / Remove: manage stream membership |
| BLOCK 266 | PascalGPU_Sync | TGPUSyncGroup.Sync procedure: synchronize all member streams |
| BLOCK 267 | PascalGPU_Sync | TGPUTimeline class: ordered list of events for dependency tracking |
| BLOCK 268 | PascalGPU_Sync | TGPUTimeline.AddEvent: append event with predecessor dependency |
| BLOCK 269 | PascalGPU_Sync | TGPUTimeline.WaitAll: block host on all timeline events |
| BLOCK 270 | PascalGPU_Sync | TGPUElapsedTimer class: start/stop GPU timer returning microseconds |
| BLOCK 271 | PascalGPU_Sync | TGPUElapsedTimer.Start / Stop / Reset / ReadUs methods |
| BLOCK 272 | PascalGPU_Sync | TGPULapTimer class: lap timer with per-lap history for benchmarking |
| BLOCK 273 | PascalGPU_Sync | TGPUHostDeviceSync class: double-buffer host-device alternating sync |
| BLOCK 274 | PascalGPU_Sync | GPUWaitForAll: variadic overload to wait on any number of events |
| BLOCK 275 | PascalGPU_Sync | TGPUConditionVar class: host-side condition variable tied to GPU events |
| BLOCK 276 | PascalGPU_Sync | TGPUConditionVar.Wait / Notify / NotifyAll methods |
| BLOCK 277 | PascalGPU_Sync | TGPUDeadlockDetector class: cycle-detection over event dependency graph |
| BLOCK 278 | PascalGPU_Sync | GPUSyncStats record: avg-wait-ns, max-wait-ns, stall-count per stream |
| BLOCK 279 | PascalGPU_Sync | GPUGetSyncStats function: populate GPUSyncStats for a stream |
| BLOCK 280 | PascalGPU_Sync | TGPUInterruptHandler class: signal async kernel abort via event cancel |
| BLOCK 281 | PascalGPU_Sync | TGPUInterruptHandler.Register / Deregister: hook SIGINT-like cancelation |
| BLOCK 282 | PascalGPU_Sync | TGPUTicketBarrier class: ordered N-party barrier with ticket numbers |
| BLOCK 283 | PascalGPU_Sync | TGPUPhaseBarrier class: repeated N-party barrier for iterative algorithms |
| BLOCK 284 | PascalGPU_Sync | GPUEventChain procedure: create linear chain of stream-wait-event edges |
| BLOCK 285 | PascalGPU_Sync | TGPUSyncLog class: timestamped log of every sync event for debugging |
| BLOCK 286 | PascalGPU_Numerical | TGPUScalarOps class: device-side scalar add/sub/mul/div/mod/abs/neg |
| BLOCK 287 | PascalGPU_Numerical | TGPUVectorOps class: element-wise operations on TGPUDeviceBuffer arrays |
| BLOCK 288 | PascalGPU_Numerical | GPUVecAdd / GPUVecSub / GPUVecMul / GPUVecDiv: fused element-wise kernels |
| BLOCK 289 | PascalGPU_Numerical | GPUVecScale function: multiply every element by a scalar value |
| BLOCK 290 | PascalGPU_Numerical | GPUVecAxpy function: BLAS-1 AXPY: y = a*x + y in-place |
| BLOCK 291 | PascalGPU_Numerical | GPUDotProduct function: parallel dot product returning device scalar |
| BLOCK 292 | PascalGPU_Numerical | GPUNorm1 / GPUNorm2 / GPUNormInf: L1, L2, Linf norm reduction kernels |
| BLOCK 293 | PascalGPU_Numerical | GPUReduceSum / GPUReduceMin / GPUReduceMax: device-side reduction kernels |
| BLOCK 294 | PascalGPU_Numerical | GPUScan function: inclusive/exclusive prefix-sum over device array |
| BLOCK 295 | PascalGPU_Numerical | GPUSort function: device radix-sort with ascending/descending option |
| BLOCK 296 | PascalGPU_Numerical | GPUSortByKey function: sort values array by companion keys array |
| BLOCK 297 | PascalGPU_Numerical | GPUUnique function: remove duplicate elements after sort |
| BLOCK 298 | PascalGPU_Numerical | GPUGather / GPUScatter: indexed gather and scatter kernels |
| BLOCK 299 | PascalGPU_Numerical | GPUSegmentedReduce function: reduction within variable-length segments |
| BLOCK 300 | PascalGPU_Numerical | GPUSparseVecDot function: CSR-format sparse-dense dot product |
| BLOCK 301 | PascalGPU_Numerical | TGPUSparseCSR class: compressed-sparse-row storage with conversion |
| BLOCK 302 | PascalGPU_Numerical | TGPUSparseCSC class: compressed-sparse-column storage |
| BLOCK 303 | PascalGPU_Numerical | TGPUSparseCOO class: coordinate-list sparse format |
| BLOCK 304 | PascalGPU_Numerical | GPUSparseConvert procedure: CSR <-> CSC <-> COO format conversion |
| BLOCK 305 | PascalGPU_Numerical | TGPUFFTPlan class: cuFFT/clFFT plan for 1-D/2-D/3-D transforms |
| BLOCK 306 | PascalGPU_Numerical | TGPUFFTPlan.Execute: forward FFT in-place or out-of-place |
| BLOCK 307 | PascalGPU_Numerical | TGPUFFTPlan.ExecuteInverse: inverse FFT with optional normalization |
| BLOCK 308 | PascalGPU_Numerical | TGPURealFFTPlan class: real-to-complex and complex-to-real FFT plan |
| BLOCK 309 | PascalGPU_Numerical | TGPUBatchedFFT class: batched FFT over N independent signals |
| BLOCK 310 | PascalGPU_Numerical | GPURandInit function: initialize cuRAND/device RNG with seed |
| BLOCK 311 | PascalGPU_Numerical | GPURandUniform function: fill buffer with uniform [0,1) floats |
| BLOCK 312 | PascalGPU_Numerical | GPURandNormal function: fill buffer with Gaussian N(mu, sigma) values |
| BLOCK 313 | PascalGPU_Numerical | GPURandPoisson function: fill buffer with Poisson(lambda) integers |
| BLOCK 314 | PascalGPU_Numerical | GPURandShuffle procedure: Fisher-Yates in-place shuffle on device |
| BLOCK 315 | PascalGPU_Numerical | TGPUHistogram class: fixed-width bucket histogram on device array |
| BLOCK 316 | PascalGPU_Numerical | TGPUHistogram.Compute procedure: fill bucket counts from input buffer |
| BLOCK 317 | PascalGPU_Numerical | TGPUHistogram.Normalize procedure: convert counts to probability density |
| BLOCK 318 | PascalGPU_Numerical | GPUConvolve1D function: discrete 1-D convolution via FFT or direct |
| BLOCK 319 | PascalGPU_Numerical | GPUConvolve2D function: 2-D image convolution with separable filter |
| BLOCK 320 | PascalGPU_Numerical | GPUCorrelate1D function: cross-correlation of two device vectors |
| BLOCK 321 | PascalGPU_Numerical | TGPUInterpolator class: 1-D linear/cubic spline on device data |
| BLOCK 322 | PascalGPU_Numerical | TGPUInterpolator.Evaluate function: sample interpolation at N query points |
| BLOCK 323 | PascalGPU_Numerical | GPUPolynomialEval function: Horner-scheme poly evaluation on device |
| BLOCK 324 | PascalGPU_Numerical | GPUExpMovingAvg function: exponential moving average in-place kernel |
| BLOCK 325 | PascalGPU_Numerical | TGPUNumericalODE class: 4th-order Runge-Kutta integrator on device |
| BLOCK 326 | PascalGPU_Numerical | TGPUNumericalODE.Step function: advance state vector by time-step dt |
| BLOCK 327 | PascalGPU_Numerical | GPUSoftmax function: numerically-stable softmax over logit vector |
| BLOCK 328 | PascalGPU_Numerical | GPULogSumExp function: log-sum-exp reduction for log-space arithmetic |
| BLOCK 329 | PascalGPU_Numerical | GPUSigmoid / GPUReLU / GPUGELU: pointwise activation function kernels |
| BLOCK 330 | PascalGPU_Numerical | TGPUNumericalPrecision enumeration: FP16, TF32, BF16, FP32, FP64 |
| BLOCK 331 | PascalGPU_Numerical | GPUCastBuffer function: convert buffer between numerical precisions |
| BLOCK 332 | PascalGPU_Numerical | TGPUQuantizer class: per-tensor and per-channel INT8/INT4 quantisation |
| BLOCK 333 | PascalGPU_Numerical | TGPUQuantizer.Quantize / Dequantize: forward and inverse transform |
| BLOCK 334 | PascalGPU_Numerical | GPUStochasticRound function: stochastic rounding for quantization |
| BLOCK 335 | PascalGPU_Numerical | TGPUKahanSum class: Kahan-compensated summation for numerical stability |
| BLOCK 336 | PascalGPU_Matrix | TGPUMatrix class: 2-D device matrix with shape, stride, dtype |
| BLOCK 337 | PascalGPU_Matrix | TGPUMatrix.Create: constructor from rows/cols/dtype with optional init |
| BLOCK 338 | PascalGPU_Matrix | TGPUMatrix.FromHost: upload Pascal 2-D array to device matrix |
| BLOCK 339 | PascalGPU_Matrix | TGPUMatrix.ToHost: download device matrix to Pascal 2-D array |
| BLOCK 340 | PascalGPU_Matrix | TGPUMatrix.Reshape function: zero-copy reshape returning new view |
| BLOCK 341 | PascalGPU_Matrix | TGPUMatrix.Transpose function: transpose with optional in-place copy |
| BLOCK 342 | PascalGPU_Matrix | TGPUMatrix.Slice function: sub-matrix view without allocation |
| BLOCK 343 | PascalGPU_Matrix | GPUGemm function: cuBLAS GEMM C = alpha*A*B + beta*C |
| BLOCK 344 | PascalGPU_Matrix | GPUGemmBatched function: batched GEMM over array of matrix triples |
| BLOCK 345 | PascalGPU_Matrix | GPUGemmStridedBatched: strided-batch GEMM for contiguous tensor stacks |
| BLOCK 346 | PascalGPU_Matrix | GPUSymmMatMul function: symmetric matrix multiply exploiting lower/upper triangle |
| BLOCK 347 | PascalGPU_Matrix | GPUHermMatMul function: Hermitian matrix multiply for complex matrices |
| BLOCK 348 | PascalGPU_Matrix | GPUTrmm function: triangular matrix multiply (TRMM) |
| BLOCK 349 | PascalGPU_Matrix | GPUTrsm function: triangular solve (TRSM) with multiple right-hand sides |
| BLOCK 350 | PascalGPU_Matrix | GPUSyr2k function: symmetric rank-2k update of matrix C |
| BLOCK 351 | PascalGPU_Matrix | TGPUSVDResult record: U, S, Vt device matrices from SVD |
| BLOCK 352 | PascalGPU_Matrix | GPUSVD function: full or economy SVD via cuSOLVER |
| BLOCK 353 | PascalGPU_Matrix | GPUTruncatedSVD function: k-rank approximation via randomized SVD |
| BLOCK 354 | PascalGPU_Matrix | TGPUEigenResult record: eigenvalues and eigenvectors device arrays |
| BLOCK 355 | PascalGPU_Matrix | GPUEigen function: symmetric eigendecomposition via cuSOLVER |
| BLOCK 356 | PascalGPU_Matrix | GPUGeneralEigen function: general eigendecomposition (non-symmetric) |
| BLOCK 357 | PascalGPU_Matrix | GPUCholesky function: Cholesky factorization L*L^T for SPD matrices |
| BLOCK 358 | PascalGPU_Matrix | GPULU function: LU factorization with partial pivoting |
| BLOCK 359 | PascalGPU_Matrix | GPUQR function: QR factorization via Householder reflections |
| BLOCK 360 | PascalGPU_Matrix | GPUSolveLinear function: solve A*X = B given LU factorization |
| BLOCK 361 | PascalGPU_Matrix | GPUSolveLeastSquares function: least-squares solve via QR |
| BLOCK 362 | PascalGPU_Matrix | GPUMatInverse function: dense matrix inverse via LU factorization |
| BLOCK 363 | PascalGPU_Matrix | GPUPseudoInverse function: Moore-Penrose pseudo-inverse via SVD |
| BLOCK 364 | PascalGPU_Matrix | GPUDeterminant function: log-determinant from LU pivot product |
| BLOCK 365 | PascalGPU_Matrix | GPUTrace function: sum of diagonal elements |
| BLOCK 366 | PascalGPU_Matrix | GPUFrobeniusNorm function: Frobenius norm of device matrix |
| BLOCK 367 | PascalGPU_Matrix | GPUConditionNumber function: ratio of max to min singular value |
| BLOCK 368 | PascalGPU_Matrix | GPURank function: numerical matrix rank given tolerance |
| BLOCK 369 | PascalGPU_Matrix | TGPUTensor class: N-dimensional tensor with strides and batch dims |
| BLOCK 370 | PascalGPU_Matrix | TGPUTensor.Contiguous function: make tensor physically contiguous |
| BLOCK 371 | PascalGPU_Matrix | TGPUTensor.Permute function: axis permutation returning view |
| BLOCK 372 | PascalGPU_Matrix | TGPUTensor.Squeeze / Unsqueeze: remove/add unit dimensions |
| BLOCK 373 | PascalGPU_Matrix | TGPUTensor.Broadcast: expand dimensions via stride tricks |
| BLOCK 374 | PascalGPU_Matrix | GPUTensorDot function: Einstein-summation contraction of two tensors |
| BLOCK 375 | PascalGPU_Matrix | GPUOuterProduct function: outer product of two vectors to matrix |
| BLOCK 376 | PascalGPU_Matrix | GPUKronecker function: Kronecker product of two matrices |
| BLOCK 377 | PascalGPU_Matrix | GPUHadamard function: element-wise matrix product (Hadamard) |
| BLOCK 378 | PascalGPU_Matrix | TGPUBandMatrix class: compact band-storage matrix (kl, ku) |
| BLOCK 379 | PascalGPU_Matrix | GPUBandedSolve function: solver for banded linear systems |
| BLOCK 380 | PascalGPU_Matrix | TGPUTriangularMatrix class: packed triangular storage (upper/lower) |
| BLOCK 381 | PascalGPU_Matrix | GPUSymmetricEigenAll function: all eigenvalues of symmetric matrix |
| BLOCK 382 | PascalGPU_Matrix | GPUPowerMethod function: dominant eigenvector by power iteration |
| BLOCK 383 | PascalGPU_Matrix | TGPUMatrixStats record: mean, variance, min, max of matrix elements |
| BLOCK 384 | PascalGPU_Matrix | GPUMatrixStats function: compute TGPUMatrixStats for device matrix |
| BLOCK 385 | PascalGPU_Matrix | GPUNormalizeRows / GPUNormalizeCols: L2-normalize rows or columns |
| BLOCK 386 | PascalGPU_Matrix | GPUCovarianceMatrix function: covariance from N-by-D data matrix |
| BLOCK 387 | PascalGPU_Matrix | GPUPCAReduce function: top-k PCA projection using truncated SVD |
| BLOCK 388 | PascalGPU_Matrix | TGPUMatrixPool class: recycle same-shaped device matrices |
| BLOCK 389 | PascalGPU_Matrix | GPUPrint2D procedure: formatted console dump of small device matrix |
| BLOCK 390 | PascalGPU_Matrix | GPUCompareMatrices function: element-wise max absolute error |
| BLOCK 391 | PascalGPU_Advanced | TGPUNeuralLayer abstract class: forward/backward interface |
| BLOCK 392 | PascalGPU_Advanced | TGPULinearLayer class: dense linear layer with weight/bias tensors |
| BLOCK 393 | PascalGPU_Advanced | TGPUConv2DLayer class: 2-D convolution with padding, stride, dilation |
| BLOCK 394 | PascalGPU_Advanced | TGPUBatchNormLayer class: batch-normalization with running statistics |
| BLOCK 395 | PascalGPU_Advanced | TGPULayerNormLayer class: layer normalization over last D dimensions |
| BLOCK 396 | PascalGPU_Advanced | TGPUDropoutLayer class: Bernoulli dropout with device-side RNG mask |
| BLOCK 397 | PascalGPU_Advanced | TGPUAttentionLayer class: scaled dot-product attention (single head) |
| BLOCK 398 | PascalGPU_Advanced | TGPUMultiHeadAttention class: multi-head attention with head-split fusions |
| BLOCK 399 | PascalGPU_Advanced | TGPUFlashAttention class: FlashAttention-2 tiled memory-efficient impl |
| BLOCK 400 | PascalGPU_Advanced | TGPUEmbeddingLayer class: lookup table for integer token indices |
| BLOCK 401 | PascalGPU_Advanced | TGPUPositionalEncoding class: sinusoidal and learnable PE variants |
| BLOCK 402 | PascalGPU_Advanced | TGPUTransformerBlock class: LN + MHA + FFN residual block |
| BLOCK 403 | PascalGPU_Advanced | TGPUFeedForwardNet class: two-layer FFN with configurable activation |
| BLOCK 404 | PascalGPU_Advanced | TGPUOptimizer abstract class: step/zero-grad interface |
| BLOCK 405 | PascalGPU_Advanced | TGPUSGDOptimizer class: SGD with momentum and weight-decay |
| BLOCK 406 | PascalGPU_Advanced | TGPUAdamOptimizer class: Adam with beta1/beta2/epsilon correction |
| BLOCK 407 | PascalGPU_Advanced | TGPUAdamWOptimizer class: AdamW decoupled weight decay |
| BLOCK 408 | PascalGPU_Advanced | TGPULRScheduler abstract class: learning-rate schedule interface |
| BLOCK 409 | PascalGPU_Advanced | TGPUCosineScheduler class: cosine-annealing LR schedule with warmup |
| BLOCK 410 | PascalGPU_Advanced | TGPUGradScaler class: dynamic loss-scale for mixed-precision training |
| BLOCK 411 | PascalGPU_Advanced | TGPUGradClipper class: global-norm gradient clipping before optimizer step |
| BLOCK 412 | PascalGPU_Advanced | TGPULossFunction abstract class: compute/reduce interface |
| BLOCK 413 | PascalGPU_Advanced | TGPUCrossEntropyLoss class: fused log-softmax + NLL loss |
| BLOCK 414 | PascalGPU_Advanced | TGPUMSELoss class: mean-squared-error loss with reduction options |
| BLOCK 415 | PascalGPU_Advanced | TGPUHuberLoss class: smooth L1 (Huber) loss with delta parameter |
| BLOCK 416 | PascalGPU_Advanced | TGPUModelCheckpoint class: save/load parameter tensors to binary file |
| BLOCK 417 | PascalGPU_Advanced | TGPUModelCheckpoint.Save: write all layer parameters with checksums |
| BLOCK 418 | PascalGPU_Advanced | TGPUModelCheckpoint.Load: verify checksums and restore parameters |
| BLOCK 419 | PascalGPU_Advanced | TGPUInferenceEngine class: forward-only mode with fused ops |
| BLOCK 420 | PascalGPU_Advanced | TGPUKVCache class: key-value cache for autoregressive inference |
| BLOCK 421 | PascalGPU_Advanced | TGPUBeamSearch class: beam-search decoding with log-prob scoring |
| BLOCK 422 | PascalGPU_Advanced | TGPUGreedyDecoder class: argmax decoding for classification tasks |
| BLOCK 423 | PascalGPU_Advanced | TGPUTensorParallel class: column/row parallel linear for multi-GPU |
| BLOCK 424 | PascalGPU_Advanced | TGPUDataParallel class: DDP-style all-reduce gradient aggregation |
| BLOCK 425 | PascalGPU_Advanced | TGPUPipelineParallel class: stage-split pipeline parallelism |
| BLOCK 426 | PascalGPU_Advanced | TGPUMixedPrecisionCtx class: FP16 forward + FP32 master weights |
| BLOCK 427 | PascalGPU_Advanced | TGPUActivationCheckpoint class: gradient-checkpoint memory reduction |
| BLOCK 428 | PascalGPU_Advanced | TGPUProfilerHook class: layer-level timing via NVTX + GPU events |
| BLOCK 429 | PascalGPU_Advanced | TGPUTensorRT class: TensorRT plan export and engine execution |
| BLOCK 430 | PascalGPU_Advanced | TGPUOnnxImporter class: import ONNX model to PascalGPU layer graph |
| BLOCK 431 | PascalGPU_Advanced | TGPUQuantizedLinear class: INT8-weight linear layer with dequant |
| BLOCK 432 | PascalGPU_Advanced | TGPUSparseMoE class: sparse mixture-of-experts with top-k gating |
| BLOCK 433 | PascalGPU_Advanced | TGPUConvTranspose2D class: transposed (deconvolution) layer |
| BLOCK 434 | PascalGPU_Advanced | TGPUDepthwiseConv class: depthwise separable convolution |
| BLOCK 435 | PascalGPU_Advanced | TGPUMaxPool2D / TGPUAvgPool2D: max and average pooling layers |
| BLOCK 436 | PascalGPU_Advanced | TGPUAdaptiveAvgPool class: output-size-driven adaptive average pooling |
| BLOCK 437 | PascalGPU_Advanced | TGPUGroupNorm class: group normalization over C channels |
| BLOCK 438 | PascalGPU_Advanced | TGPUInstanceNorm class: per-sample instance normalization |
| BLOCK 439 | PascalGPU_Advanced | TGPURMSNorm class: root-mean-square layer normalization (no mean sub) |
| BLOCK 440 | PascalGPU_Advanced | TGPUSwiGLU class: SwiGLU gated linear unit activation block |
| BLOCK 441 | PascalGPU_Tests | TGPUTestRunner class: suite-based test runner with pass/fail/skip counts |
| BLOCK 442 | PascalGPU_Tests | TGPUTestCase abstract class: SetUp / TearDown / Run interface |
| BLOCK 443 | PascalGPU_Tests | RunAllTests function: execute all registered TGPUTestCase instances |
| BLOCK 444 | PascalGPU_Tests | TGPUTestRegistry class: global registry for auto-discovered test cases |
| BLOCK 445 | PascalGPU_Tests | TGPUAssert class: device-comparable assertion helpers |
| BLOCK 446 | PascalGPU_Tests | TGPUAssert.AlmostEqual: float comparison within tolerance |
| BLOCK 447 | PascalGPU_Tests | TGPUAssert.ArraysEqual: element-wise comparison of device arrays |
| BLOCK 448 | PascalGPU_Tests | TGPUAssert.MatricesAlmostEqual: Frobenius-norm bounded comparison |
| BLOCK 449 | PascalGPU_Tests | TGPUMemoryLeakChecker class: detect leaks between test cases |
| BLOCK 450 | PascalGPU_Tests | TGPUTypesTest: smoke tests for all TGPUDataType scalar operations |
| BLOCK 451 | PascalGPU_Tests | TGPUMemoryTest: alloc/copy/free round-trip for all allocator types |
| BLOCK 452 | PascalGPU_Tests | TGPUDeviceTest: enumeration, property query, and context switch test |
| BLOCK 453 | PascalGPU_Tests | TGPUKernelTest: PTX load, launch, and result validation |
| BLOCK 454 | PascalGPU_Tests | TGPUExecutionTest: stream pool, work queue, and pipeline smoke test |
| BLOCK 455 | PascalGPU_Tests | TGPUSyncTest: event create/record/synchronize round-trip |
| BLOCK 456 | PascalGPU_Tests | TGPUNumericalTest: dot-product, norm, sort, FFT correctness |
| BLOCK 457 | PascalGPU_Tests | TGPUMatrixTest: GEMM, SVD, Cholesky correctness against reference |
| BLOCK 458 | PascalGPU_Tests | TGPUAdvancedTest: linear layer forward/backward numerical gradient check |
| BLOCK 459 | PascalGPU_Tests | TGPUBenchmarkSuite class: run all benchmarks and emit JSON report |
| BLOCK 460 | PascalGPU_Tests | TGPUMemBandwidthBench: device memory bandwidth achieved vs theoretical |
| BLOCK 461 | PascalGPU_Tests | TGPUGemmBench: GEMM TFLOPS at FP32, TF32, FP16 precisions |
| BLOCK 462 | PascalGPU_Tests | TGPUConvBench: Conv2D throughput for standard ResNet layer sizes |
| BLOCK 463 | PascalGPU_Tests | TGPUAttnBench: FlashAttention vs naive attention latency comparison |
| BLOCK 464 | PascalGPU_Tests | TGPURandomTest: RNG distribution chi-square and Kolmogorov-Smirnov |
| BLOCK 465 | PascalGPU_Tests | TGPUStressTest: long-running alloc/launch/free loop for stability |
| BLOCK 466 | PascalGPU_Tests | TGPUMultiDeviceTest: peer-copy and cross-device sync correctness |
| BLOCK 467 | PascalGPU_Tests | TGPUGraphTest: capture, instantiate, launch, update CUDA graph cycle |
| BLOCK 468 | PascalGPU_Tests | TGPUQuantizationTest: INT8 round-trip error within 0.5% tolerance |
| BLOCK 469 | PascalGPU_Tests | TGPUCompatibilityTest: compute capability fallback for older devices |
| BLOCK 470 | PascalGPU_Tests | TGPUTestReport class: XML/JSON/HTML test-result report generator |
| BLOCK 471 | PascalGPU_Integration | IntegrationTest function: end-to-end smoke test returning result string |
| BLOCK 472 | PascalGPU_Integration | TGPUIntegrationSuite class: orchestrates all unit integration scenarios |
| BLOCK 473 | PascalGPU_Integration | TGPUPipelineIntegration: memory -> kernel -> sync -> output pipeline test |
| BLOCK 474 | PascalGPU_Integration | TGPUMultiDevicePipeline: two-device split-batch pipeline test |
| BLOCK 475 | PascalGPU_Integration | TGPUTrainingLoop: single-step forward + backward + optimizer integration |
| BLOCK 476 | PascalGPU_Integration | TGPUInferenceLoop: batched inference with KV cache and beam search |
| BLOCK 477 | PascalGPU_Integration | TGPUStreamOverlap: compute-copy overlap double-buffer integration |
| BLOCK 478 | PascalGPU_Integration | TGPUGraphExecutionIntegration: task-graph build and repeated launch |
| BLOCK 479 | PascalGPU_Integration | TGPUSparseIntegration: sparse GEMM end-to-end with CSR conversion |
| BLOCK 480 | PascalGPU_Integration | TGPUFFTConvIntegration: FFT-based convolution vs direct correctness |
| BLOCK 481 | PascalGPU_Integration | TGPURandMLIntegration: RNG-initialized network weights training step |
| BLOCK 482 | PascalGPU_Integration | TGPUCheckpointIntegration: save weights, reload, verify parameter equality |
| BLOCK 483 | PascalGPU_Integration | TGPUQuantizationIntegration: train FP32, quantize INT8, validate accuracy |
| BLOCK 484 | PascalGPU_Integration | TGPUMoEIntegration: sparse MoE forward pass with top-2 gating |
| BLOCK 485 | PascalGPU_Integration | TGPUOnnxRoundTrip: import ONNX, infer, compare output to reference |
| BLOCK 486 | PascalGPU_Integration | TGPUTensorRTIntegration: export plan, load engine, batch inference |
| BLOCK 487 | PascalGPU_Integration | TGPUDataParallelIntegration: DDP all-reduce gradient sync over 2 streams |
| BLOCK 488 | PascalGPU_Integration | TGPUMixedPrecisionIntegration: FP16 forward + FP32 optimizer step |
| BLOCK 489 | PascalGPU_Integration | TGPUActivationCkptIntegration: re-compute activations in backward pass |
| BLOCK 490 | PascalGPU_Integration | TGPUProfilingIntegration: full pipeline run with NVTX ranges + event timers |
| BLOCK 491 | PascalGPU_Integration | TGPUFaultInjectionTest: inject OOM, verify error propagation and recovery |
| BLOCK 492 | PascalGPU_Integration | TGPUCancellationTest: cancel long kernel, verify stream flush and reset |
| BLOCK 493 | PascalGPU_Integration | TGPUPoolStressIntegration: pool allocator under concurrent alloc/free load |
| BLOCK 494 | PascalGPU_Integration | TGPUBatchSchedulerIntegration: priority scheduler with mixed workloads |
| BLOCK 495 | PascalGPU_Integration | TGPUCopyEngineIntegration: dedicated copy engine overlapping compute |
| BLOCK 496 | PascalGPU_Integration | TGPUUnifiedMemIntegration: managed memory migration and prefetch cycle |
| BLOCK 497 | PascalGPU_Integration | TGPUIpcIntegration: cross-process IPC memory handle open/close test |
| BLOCK 498 | PascalGPU_Integration | TGPUFullStackBench: wall-clock timing of entire 500-block stack init |
| BLOCK 499 | PascalGPU_Integration | TGPUReportGenerator: write markdown report of all integration results |
| BLOCK 500 | PascalGPU_Integration | TGPUFinalSeal: WORM-seal integration report with Blake3 hash + timestamp |
