//
//  WeatherService.swift
//  Weather_App
//
//  Created by Felipe Baz on 01/07/22.
//

import Foundation
import Alamofire

protocol WeatherResponse {
    func onSuccess(response: WeatherModel)
}

class WeatherService {
    
    let delegate: WeatherResponse
    
    public init(delegate: WeatherResponse) {
        self.delegate = delegate
    }
    
    private let key = "1221406bf2ded29d8f7691e577f7b3b1"
    func getWeather(from location: String) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(key)"
        AF
            .request(url)
            .responseDecodable(of: WeatherModel.self) { response in
                switch response.result {
                case .success(let res):
                    print(res)
                    self.delegate.onSuccess(response: res)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
