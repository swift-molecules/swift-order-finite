import Cardinal
public import Finite_Enumerable
public import Order_Monotonicity
import Ordinal

extension Order.Monotonicity: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 3 }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .increasing: 0
        case .decreasing: 1
        case .constant: 2
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.increasing, .decreasing, .constant][ordinal]
    }
}
