//
//  CityInputView.swift
//  NeosoftMachineTest
//
//  Created by komal_IT on 28/11/23.
//

import SwiftUI

struct CityInputView: View {
    @State private var cityName: String = ""
    var viewModel: WeatherViewModel
    

    var body: some View {
           VStack (alignment: .leading) {
            if cityName != "", let weatherData = viewModel.weatherData {
                Text("City: \(weatherData.name)")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Text("Temperatue: \(weatherData.main.temp)")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Text("Humidity: \(weatherData.main.humidity)")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            } else {
                Text("Enter city to fetch weather...")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            
            TextField("Enter City", text: $cityName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            HStack(alignment: .center) {
                Button(action: {
                    Task {
                    await viewModel.fetchWeather(city: cityName)
                }}) {
                   Text("Get Weather")
                 }
                 .buttonStyle(.bordered)
                 .foregroundColor(.white)
                 .background(.orange)
                 .cornerRadius(5)
            }
        .navigationTitle("City Input")
        Spacer()
    }
}
