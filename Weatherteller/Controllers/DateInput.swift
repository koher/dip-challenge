import Foundation
import SwiftYMD

public final class WeathertellerInput {
    private let manager: WeathertellerManager
    
    public init(manager: WeathertellerManager) {
        self.manager = manager
    }
    
    public func setCurrentDate(_ date: Date, with timeZone: TimeZone) {
        manager.setCurrentYMD(YMD(date, timeZone: timeZone))
    }
    
    public func inputBirthday(_ date: Date, with timeZone: TimeZone) {
        manager.inputBirthday(YMD(date, timeZone: timeZone))
    }
}
