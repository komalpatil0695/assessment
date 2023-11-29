//
//  WeatherServices.swift
//  NeosoftMachineTest
//
//  Created by komal_IT on 28/11/23.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse, invalidURL
}

class WeatherServices {
    func fetchWeather(city: String) async throws -> WeatherDetails {
        
        let apiKey = "c2e11bf513cf9a27fec46156481f7c80"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)") else {
            throw NetworkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
       
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(WeatherDetails.self, from: data)
    }
}
