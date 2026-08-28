# Order Finite

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Finite enumerable conformance for the `Order` namespace — makes `Order.Monotonicity` a `Finite.Enumerable` with a fixed cardinality of three and a stable ordinal per case.

---

## Quick Start

`Finite.Enumerable` is the protocol for types with a known, finite set of values that can be indexed by ordinal. This package supplies the conformance for `Order.Monotonicity` — the three ways a sequence can be ordered (`increasing`, `decreasing`, `constant`) — so it can be counted, ordinal-indexed, and reconstructed from an ordinal without re-deriving the mapping at every call site.

```swift
import Order_Finite

// Order.Monotonicity is now Finite.Enumerable: it has a fixed cardinality
// and each case maps to a stable ordinal.
let total = Order.Monotonicity.count          // 3

let direction = Order.Monotonicity.decreasing
let index = direction.ordinal                 // 1

// Reconstruct a case from its ordinal (e.g. when decoding a compact index).
let restored = Order.Monotonicity(_unchecked: (), ordinal: index)
// restored == .decreasing
```

The ordinal-based initializer is labelled `_unchecked:` because it trusts the ordinal to lie in `0..<count`. Pass it a value you obtained from `ordinal` (as above) or one you have already bounds-checked.

The main target composes and re-exports the atom-owned `Finite` and `Order` domains with the `Finite Ordinal` owner of `Finite.Enumerable`, so importing `Order_Finite` alone brings both `Order.Monotonicity` and the enumerable protocol into scope.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-order-finite.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Order Finite", package: "swift-order-finite"),
    ]
)
```

Requires Swift 6.4 and macOS 27 / iOS 27 / tvOS 27 / watchOS 27 / visionOS 27 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends on the atom-owned `Finite`, `Order`, `Cardinal`, and `Ordinal` domains plus the `Finite Ordinal` molecule that owns `Finite.Enumerable`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Order Finite` | `Sources/Order Finite/` | Conforms `Order.Monotonicity` to `Finite.Enumerable` (`count`, `ordinal`, and the ordinal-based initializer); re-exports the current `Finite`, `Finite Ordinal`, and `Order` owners. |
| `Order Finite Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 27 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
