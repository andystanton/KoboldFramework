import SwiftUI

public extension Binding {
    static func wrapIntAsFloat<TSubject, TInt, TFloat>(
        _ subject: TSubject,
        _ keyPath: ReferenceWritableKeyPath<TSubject, TInt>
    ) -> Binding<TFloat>
    where TInt: BinaryInteger,
          TFloat: BinaryFloatingPoint
    {
        return Binding<TFloat> (
            get: {
                TFloat(subject[keyPath: keyPath])
            },
            set: {
                subject[keyPath: keyPath] = TInt($0)
            }
        )
    }

    static func keypathBinding<TSubject, TValue>(
        _ subject: TSubject,
        _ keyPath: ReferenceWritableKeyPath<TSubject, TValue>
    ) -> Binding<TValue> {
        return Binding<TValue> (
            get: {
                subject[keyPath: keyPath]
            },
            set: {
                subject[keyPath: keyPath] = $0
            }
        )
    }
}
