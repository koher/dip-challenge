import UIKit
import Combine

public class WeathertellerViewController: UIViewController {
    @IBOutlet private var birthdayPicker: UIDatePicker!
    @IBOutlet private var weatherView: UILabel!
    
    private var input: WeathertellerInput!
    private var presenter: WeatherPresenter!
    
    private var cancellables: [AnyCancellable] = []

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let timeZone: TimeZone = .current
        birthdayPicker.timeZone = timeZone

        presenter = WeatherPresenter(viewController: self)
        input = WeathertellerInput(manager: WeathertellerManager(presenter: presenter))
        input.setTimeZone(timeZone)
        input.setCurrentDate(Date())
        input.inputBirthday(birthdayPicker.date)
        
        // Updates current `timeZone`
        NotificationCenter
            .Publisher(center: .default, name: UIApplication.significantTimeChangeNotification)
            .sink { [weak self] _ in
                guard let self = self else { return }
                let newTimeZone: TimeZone = .current
                if newTimeZone != self.birthdayPicker.timeZone {
                    self.birthdayPicker.timeZone = newTimeZone
                    self.input.setTimeZone(newTimeZone)
                }
                self.input.setCurrentDate(Date())
            }
            .store(in: &cancellables)
    }
    
    @IBAction private func birthdayChanged(_ sender: UIDatePicker) {
        assert(sender === birthdayPicker)
        input.inputBirthday(sender.date)
    }
    
    public func showWeather(_ weather: String) {
        weatherView.text = weather
    }
}
