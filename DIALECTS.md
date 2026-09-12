# Multi-Dialect Pascal Compatibility Architecture

This tree preserves the existing Free Pascal Delphi and ObjFPC implementations and adds isolated dialect compatibility and conformance boundaries.

## Existing implementations

- src/, tools/, and tests/: Free Pascal Delphi mode
- handcrafted/ and expanded/: Free Pascal ObjFPC mode with C-compatible packed records where required

## Dialect targets

ISO 7185 Standard Pascal
ISO 10206 Extended Pascal
Turbo Pascal
Object Pascal
Delphi Pascal
PascalABC.NET

Each dialect has its own syntax expectations, type-system expectations, language extensions, compatibility tests, unsupported-feature declarations, conformance tests, documentation, and implementation boundary.

PascalABC.NET features requiring a .NET execution environment are explicitly runtime-dependent and are not represented as native FPC equivalence.

## Separation rule

Dialect tests never silently enable extensions from another dialect.

The compatibility layer may use the existing FPC compiler where a direct mode is technically appropriate, but the public dialect identity remains explicit.
