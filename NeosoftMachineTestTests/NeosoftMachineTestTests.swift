//
//  NeosoftMachineTestTests.swift
//  NeosoftMachineTestTests
//
//  Created by komal_IT on 28/11/23.
//

import XCTest
@testable import NeosoftMachineTest

final class NeosoftMachineTestTests: XCTestCase {
    
    func testFetchWeather() {
        let viewModel = WeatherViewModel()
        let city = "Delhi"
        Task {
            await viewModel.fetchWeather(city: city)
        }

        // Assert
        DispatchQueue.global().async {
            // Simulate a delay to allow the asynchronous fetch to complete
            sleep(1)
            // Ensure that the weatherData is not nil after the fetch
            XCTAssertNotNil(viewModel.weatherData)
        }
    }
    
    func testNegativeFetchWeather() {
        let viewModel = WeatherViewModel()
        let city = ""
        Task {
            await viewModel.fetchWeather(city: city)
        }

        // Assert
        DispatchQueue.global().async {
            // delay to allow the asynchronous fetch to complete
            sleep(1)
            // Ensure that the weatherData is nil after the fetch
            XCTAssertNil(viewModel.weatherData)
        }
    }
}
