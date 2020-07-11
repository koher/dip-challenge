import Foundation
import SwiftYMD

public final class WeathertellerInput {
    private let manager: WeathertellerManager
    
    public init(manager: WeathertellerManager) {
        self.manager = manager
    }

    private var currentDate: Date?
    private var timeZone: TimeZone?
    private var birthday: Date?

    public func setCurrentDate(_ currentDate: Date) {
        self.currentDate = currentDate
        guard let timeZone = self.timeZone else { return }
        manager.setCurrentYMD(YMD(currentDate, timeZone: timeZone))
    }
    
    public func setTimeZone(_ timeZone: TimeZone) {
        self.timeZone = timeZone
        guard
            let currentDate = self.currentDate,
            let birthday = self.birthday
        else { return }
        manager.setCurrentYMD(YMD(currentDate, timeZone: timeZone))
        manager.inputBirthday(YMD(birthday, timeZone: timeZone))
    }
    
    public func inputBirthday(_ birthday: Date) {
        self.birthday = birthday
        guard let timeZone = self.timeZone else { return }
        manager.inputBirthday(YMD(birthday, timeZone: timeZone))
    }
}
