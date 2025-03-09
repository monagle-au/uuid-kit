import Foundation

extension UUIDv1 {
    internal actor Clock {
            func next() -> (timestamp: Timestamp, clockSequence: ClockSequence) {
                let timestamp = Timestamp()
                
                // Ensure timestamps are always strictly increasing
                if timestamp <= lastTimestamp {
                    clockSequence = clockSequence.next
                }
                
                lastTimestamp = timestamp
                return (timestamp, clockSequence)
            }
            
            static let `default`: Clock = .init()
            
            private var clockSequence: ClockSequence = .random()
            private var lastTimestamp: Timestamp = .zero
        }
}
