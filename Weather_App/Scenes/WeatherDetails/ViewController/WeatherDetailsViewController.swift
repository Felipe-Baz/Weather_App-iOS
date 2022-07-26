//
//  WeatherDetailsViewController.swift
//  Weather_App
//
//  Created by Felipe Baz on 04/07/22.
//

import UIKit


class WeatherDetailsViewController: UIViewController, WeatherResponse {
    
    var service: WeatherService?
    
    // MARK: Fields in screen
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureDetailsLabel: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var visibility: UILabel!
    
    // MARK: Service functions
    
    func onSuccess(response: WeatherModel) {
        print(response)
        reloadCard(res: response)
    }
    
    func getInfo() {
        guard let data = data?.nome else {
            return
        }
        service?.getWeather(from: data)
    }
    
    // MARK: Place info
    
    var data: PlaceModel? = nil
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = WeatherService(delegate: self)
        getInfo()
    }
    
    // MARK: Config to talk between screens
    
    func setData(data: PlaceModel) {
        self.data = data
    }
    
    // MARK: Reload Functions & actions
    
    @IBAction func AtualizarButton(_ sender: UIButton) {
        print("atualizar")
        getInfo()
    }
    
    func reloadCard(res: WeatherModel) {
        print("reload Card")
        formatTemperature(weather: res)
        formatTemperatureDetails(weather: res)
        formatTimesDetails(weather: res)
        formatPressureDetails(weather: res)
        formatHumidityDetails(weather: res)
        formatWindVelocityDetails(weather: res)
    }
    
    
    //MARK: Formatters
    
    private func formatTemperature(weather: WeatherModel) {
        debugPrint("Format Temperature")
        let temp = kelvinToCelsius(
            kelvin: weather.main.temp
        )
        temperatureLabel.text = "\(temp)º"
    }
    
    private func formatTemperatureDetails(weather: WeatherModel){
        debugPrint("Format Temperature Details")
        let temp_min = kelvinToCelsius(
            kelvin: weather.main.temp_min
        )
        let temp_max = kelvinToCelsius(
            kelvin: weather.main.temp_max
        )
        let feels_like = kelvinToCelsius(
            kelvin: weather.main.feels_like
        )
        let label = "\(temp_min)º / \(temp_max)º Sensação térmica de \(feels_like)º"
        temperatureDetailsLabel.text = label
    }
    
    private func formatTimesDetails(weather: WeatherModel) {
        debugPrint("Format Times Details")
        sunsetTime.text = formatTime(with: Double(weather.sys.sunset))
        sunriseTime.text = formatTime(with: Double(weather.sys.sunrise))
    }
    
    private func formatPressureDetails(weather: WeatherModel) {
        debugPrint("Format Pressure Details")
        pressure.text = formatPressure(with: weather.main.pressure)
    }
    
    private func formatHumidityDetails(weather: WeatherModel) {
        debugPrint("Format Humidity Details")
        humidity.text = formatHumidity(with: weather.main.humidity)
    }
    
    private func formatWindVelocityDetails(weather: WeatherModel) {
        debugPrint("Format Wind Velocity details")
        windSpeed.text = formatWindVelocity(with: weather.wind.speed)
    }
    
    private func formatVisibilityDetails(weather: WeatherModel) {
        debugPrint("Format Visibility Details")
        visibility.text = formatVisibility(with: weather.visibility)
    }
    
    //MARK: Helpers
    
    private func kelvinToCelsius(kelvin: Float) -> Int {
        let celsius = kelvin - 273.15
        return Int(celsius)
    }
    
    private func formatTime(with timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    private func formatPressure(with pressure: Float) -> String{
        return "\(pressure) hPa"
    }
    
    private func formatHumidity(with humidity: Float) -> String {
        return "\(Int(humidity))%"
    }
    
    private func formatWindVelocity(with windVelocity: Float) -> String {
        return "\(windVelocity) km/h"
    }
    
    private func formatVisibility(with visibility: Int) -> String {
        let visibility = visibility / 1000
        return "\(visibility) Km"
    }
    
    private func formatPoints(in number: Float) -> String{
        let numberFormatter = NumberFormatter()

        // Configura a estrategia de pontuação de acordo com o local desejado
        numberFormatter.locale = Locale.current

        // Configura o tipo de retorno desejado
        numberFormatter.numberStyle = .decimal

        // Formata a string usando o setup definido
        return numberFormatter.string(from: NSNumber(value: number)) ?? "Valor Inválido"
    }
}
