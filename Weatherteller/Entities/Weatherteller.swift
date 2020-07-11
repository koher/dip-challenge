import SwiftYMD

public struct Weatherteller {
    public init() {}
    
    public func tell(for birthday: YMD, on date: YMD) -> Weather {
        let y = birthday.year.rawValue
        let m = birthday.month.rawValue
        let d = birthday.day
        
        var n = ((y &* 100) &+ m) &* 100 &+ d
        for _ in 1 ... 10 {
            n = (a &* n) % b
        }
        switch (n % 4 + 4) % 4 {
        case 0:
            return .sunny
        case 1:
            return .cloudy
        case 2:
            return .rainy
        default:
            return .snowy
        }
    }
}

private let a = 48271
private let b = 0xFFFFFFFF - 1
