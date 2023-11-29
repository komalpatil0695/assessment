//
//  WeatherViewModel.swift
//  NeosoftMachineTest
//
//  Created by komal_IT on 28/11/23.
//

import Foundation

@Observable class WeatherViewModel {
    var weatherData: WeatherDetails?

    private let services: WeatherServices
    
    init(service: WeatherServices = WeatherServices()) {
        self.services = service
    }
    
    func fetchWeather(city: String) async {
        do {
            weatherData = try await services.fetchWeather(city: city)
        } catch {
            print("Error in fetch:", error)
        }
    }
}
