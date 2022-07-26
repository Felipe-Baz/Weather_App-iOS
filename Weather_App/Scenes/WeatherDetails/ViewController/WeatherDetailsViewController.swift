//
//  WeatherDetailsViewController.swift
//  Weather_App
//
//  Created by Felipe Baz on 04/07/22.
//

import UIKit


class WeatherDetailsViewController: UIViewController, WeatherResponse {
    var service: WeatherService?
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureDetailsLabel: UILabel!
    @IBOutlet weak var umidadeLabel: UILabel!
    @IBOutlet weak var pressaoLabel: UILabel!
    
    func onSuccess(response: WeatherModel) {
        print(response)
        reloadCard(res: response)
    }
    
    var data: PlaceModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = WeatherService(delegate: self)
        getInfo()
    }
    
    func setData(data: PlaceModel) {
        self.data = data
    }
    
    @IBAction func AtualizarButton(_ sender: UIButton) {
        print("atualizar")
        getInfo()
    }
    
    func reloadCard(res: WeatherModel) {
        print("reload Card")
        formatTemperature(weather: res)
        formatTemperatureDetails(weather: res)
    }
    
    func getInfo() {
        guard let data = data?.nome else {
            return
        }
        service?.getWeather(from: data)
    }
    
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
    
    private func kelvinToCelsius(kelvin: Float) -> Int {
        let celsius = kelvin - 273.15
        return Int(celsius)
    }
}
