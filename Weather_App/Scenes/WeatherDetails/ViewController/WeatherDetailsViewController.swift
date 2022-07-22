//
//  WeatherDetailsViewController.swift
//  Weather_App
//
//  Created by Felipe Baz on 04/07/22.
//

import UIKit


class WeatherDetailsViewController: UIViewController, WeatherResponse {
    var service: WeatherService?
    
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
        print("obj: \(res)")
        print("reload Card")
    }
    
    func getInfo() {
        guard let data = data?.nome else {
            return
        }
        service?.getWeather(from: data)
    }
}
