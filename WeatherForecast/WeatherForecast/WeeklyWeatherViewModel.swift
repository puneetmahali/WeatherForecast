//
//  WeekelyWeatherViewModel.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 01.07.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "London") {
        WeatherAPI.weeklyWeather(city) {
            self.weather = $0
        }
    }
}
