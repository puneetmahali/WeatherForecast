//
//  CurrentWeatherViewModel.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}


extension CurrentWeatherViewModel {
    func fetch(_ city: String = "London") {
        WeatherAPI.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}

 
