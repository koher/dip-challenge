public final class WeatherPresenter {
    private weak var viewController: WeathertellerViewController?
    
    public init(viewController: WeathertellerViewController) {
        self.viewController = viewController
    }
    
    public func present(_ weather: Weather?) {
        guard let viewController = self.viewController else { return }
        let weatherText: String
        switch weather {
        case .none:
            weatherText = ""
        case .sunny:
            weatherText = "☀"
        case .cloudy:
            weatherText = "☁"
        case .rainy:
            weatherText = "☂"
        case .snowy:
            weatherText = "❄"
        }
        viewController.showWeather(weatherText)
    }
}
