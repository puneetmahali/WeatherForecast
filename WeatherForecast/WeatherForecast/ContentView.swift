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
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    private var height = UIScreen.main.bounds.height
    @State var city: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter your city", text: $city){
            self.weather.fetch(self.city)
            self.weeklyWeather.fetch(by: self.city)
            }.padding(.horizontal)
            
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.50).animation(.easeInOut(duration: 0.5))
            }
            VStack{
                Picker("", selection: $selected) {
                    Text("Today")
                        .tag(0)
                    Text("Week")
                    .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
