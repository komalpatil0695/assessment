//
//  WeatherView.swift
//  NeosoftMachineTest
//
//  Created by komal_IT on 28/11/23.
//

import SwiftUI

struct WeatherView: View {
    private var viewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let weatherData = viewModel.weatherData {
                    Text("City: \(weatherData.name)")
                    Text("Temperatue: \(weatherData.main.temp)")
                    Text("Humidity: \(weatherData.main.humidity)")
                } else {
                    Text("Fetching weather...")
                    .padding()
                }
                NavigationLink("Enter City", destination: CityInputView(viewModel: viewModel))
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(5)
            }
        
            .navigationTitle("Weather App")
            .task {
                await viewModel.fetchWeather(city: "")
            }
        }
        Spacer()
    }
}
