import SwiftYMD

public final class WeathertellerManager {
    private let weatherteller: Weatherteller = .init()
    
    private var currentYMD: YMD?
    private var birthday: YMD?
    
    private weak var presenter: WeatherPresenter?
    
    public init(presenter: WeatherPresenter) {
        self.presenter = presenter
    }
    
    public func setCurrentYMD(_ ymd: YMD) {
        currentYMD = ymd
        updateWeather()
    }
    
    public func inputBirthday(_ ymd: YMD) {
        birthday = ymd
        updateWeather()
    }
    
    private func updateWeather() {
        guard let presenter = self.presenter else { return }
        guard
            let birthday = self.birthday,
            let currentYMD = self.currentYMD
        else {
            presenter.present(nil)
            return
        }
        
        let weather = weatherteller.tell(for: birthday, on: currentYMD)
        presenter.present(weather)
    }
}
