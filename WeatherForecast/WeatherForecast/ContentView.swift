//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Puneet Mahali on 16.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height *)
            }
            
            
            
            Text(Weather)
        }
    }
    
}
