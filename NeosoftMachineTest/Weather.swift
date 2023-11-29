//
//  Weather.swift
//  NeosoftMachineTest
//
//  Created by komal_IT on 28/11/23.
//

import Foundation

struct WeatherDetails: Codable {
    let timezone: Int
    let id: Int
    let name: String
    let weather: [Weather]
    let main: Main
    
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}
