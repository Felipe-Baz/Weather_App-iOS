//
//  WeatherModel.swift
//  Weather_App
//
//  Created by Felipe Baz on 09/07/22.
//

import Foundation

struct WeatherModel: Codable {
    let main: Main
    let visibility: Int
    let wind: Wind
    let sys: Sys
}

struct Main: Codable  {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
}

struct Wind: Codable {
    let speed: Float
}

struct Sys: Codable {
    let sunrise: Int
    let sunset: Int
}
